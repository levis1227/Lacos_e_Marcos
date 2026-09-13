import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/core/theme/app_typography.dart';
import 'package:projeto_atual/app/data/models/marco_model.dart';
import 'package:projeto_atual/app/data/providers/marcos_data.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:projeto_atual/app/widgets/status_icon_widget.dart';

class Marcos extends StatefulWidget {
  const Marcos({super.key});

  @override
  State<Marcos> createState() => _MarcosState();
}

class _MarcosState extends State<Marcos> {
  // Lista de filtros de faixa etária
  final List<String> _filtros = [
    "Todos",
    "0-3 meses",
    "4-6 meses",
    "7-9 meses",
    "10-12 meses",
  ];

  int _filtroSelecionado = 1; // "4-6 meses" selecionado por padrão como na foto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 8.h,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 22.sp, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: IconButton(
              icon: Icon(Icons.filter_alt_outlined, size: 22.sp, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.selectProfile);
              },
            ),
          ),
        ],
        title: Text(
          "Marcos do desenvolvimento",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.h),

            // Barra de Filtros Horizontais
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: List.generate(_filtros.length, (index) {
                  final isSelected = _filtroSelecionado == index;
                  return Padding(
                    padding: EdgeInsets.only(right: 2.5.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _filtroSelecionado = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.5.w,
                          vertical: 1.2.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.green
                              : const Color(0xFFF2F4F2),
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        child: Text(
                          _filtros[index],
                          style: AppTypography.bodySmall.copyWith(
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 2.5.h),

            // Card Principal com os Marcos
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.w),
                  border: Border.all(
                    color: const Color(0xFFE2E2E2),
                    width: 0.3.w,
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: marcosData.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    color: Color(0xFFE2E2E2),
                  ),
                  itemBuilder: (context, index) {
                    final item = marcosData[index];
                    final isAlert = item.status == TimelineStatus.sync;

                    return Container(
                      decoration: BoxDecoration(
                        color: isAlert ? const Color(0xFFFFF0F0) : Colors.transparent,
                        borderRadius: _getBorderRadius(index, marcosData.length),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 0.5.h,
                        ),
                        leading: StatusIconWidget(status: item.status),
                        title: Text(
                          item.titulo,
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        subtitle: Text(
                          "Geralmente entre ${item.idade}",
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 13.sp,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.black45,
                          size: 18.sp,
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  BorderRadius _getBorderRadius(int index, int total) {
    if (index == 0) {
      return BorderRadius.vertical(top: Radius.circular(5.w));
    } else if (index == total - 1) {
      return BorderRadius.vertical(bottom: Radius.circular(5.w));
    }
    return BorderRadius.zero;
  }
}
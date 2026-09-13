import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projeto_atual/app/widgets/comment_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/widgets/proximos_marcos_card.dart';

class MarcoRegisterPage extends StatefulWidget {
  const MarcoRegisterPage({super.key});

  @override
  State<MarcoRegisterPage> createState() => _MarcoRegisterPageState();
}

class _MarcoRegisterPageState extends State<MarcoRegisterPage> {
  late final TextEditingController date;
  late DateTime newDateTime;
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    date = TextEditingController();
    newDateTime = DateTime.now();
    // Formatação inicial com locale em pt_BR
    formattedDate = DateFormat("dd/MM/yyyy", "pt_BR").format(newDateTime);
    date.text = formattedDate;
  }

  @override
  void dispose() {
    date.dispose();
    super.dispose();
  }

  void dateTime() async {
    FocusScope.of(context).unfocus();
    final selectedDate = await showRoundedDatePicker(
      context: context,
      initialDate: newDateTime,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      locale: const Locale('pt', 'BR'),
      theme: ThemeData(primarySwatch: Colors.cyan),
      height: 30.h,
      borderRadius: 26.sp,
    );

    if (selectedDate != null) {
      setState(() {
        newDateTime = selectedDate;
        formattedDate = DateFormat("dd/MM/yyyy", "pt_BR").format(newDateTime);
        date.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Registrar marco",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProximosMarcosCard(
                title: 'Sentar sem apoio',
                ageRange: 'Entre 6 e 7 meses',
                imagePath: "images/avatar.jpg",
                icon: Icons.arrow_forward_ios_rounded,
                iconColor: AppColors.disabledButton,
                onTap: () {},
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Data",
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.25.h),
              GestureDetector(
                onTap: dateTime,
                child: SizedBox(
                  width: 95.w,
                  child: TextFormField(
                    controller: date,
                    readOnly: true,
                    onTap: dateTime,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: textTheme.bodyMedium?.copyWith(
                        color: Colors.black38,
                      ),
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: AppColors.textSecondary,
                        size: 19.sp,
                      ),

                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFE2E2E2),
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFE2E2E2),
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFE2E2E2),
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Observações (opcional)",
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.25.h),
              CommentTextField(text: 'Como foi esse momento?\nConte aqui...'),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Adicionar foto ou vídeo (opcional)",
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height:
                        MediaQuery.of(context).size.height *
                        0.2, // Ajuste a altura conforme necessário
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () {
                          // Ação ao clicar na câmera
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFE2E2E2),
                              width: 1.2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.textSecondary,
                                size: 28.sp,
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                "Câmera",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.black38,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height:
                        MediaQuery.of(context).size.height *
                        0.2, // Ajuste a altura conforme necessário
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () {
                          // Ação ao clicar na câmera
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFE2E2E2),
                              width: 1.2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.videocam_outlined,
                                color: AppColors.textSecondary,
                                size: 28.sp,
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                "Vídeo",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.black38,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Salvar registro",
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

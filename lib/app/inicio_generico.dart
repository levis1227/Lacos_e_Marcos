import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NomeDaPagina extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 10.h,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: IconButton(
              icon: Icon(Icons.notifications_outlined, size: 24.sp),
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.selectProfile);
              },
            ),
          ),
        ],
        title: Text(
          "Título",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:projeto_atual/app/widgets/baby_link_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LinkBabyPage extends StatelessWidget {
  const LinkBabyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 10.h,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.login);
          },
        ),
        title: Text(
          "Vincular bebê",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      "images/vinculoS.jpg",
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.homepage);
              },
              child: const BabyLinkCard(
                image: "images/mais.png",
                maintext: "Criar perfil do bebê",
                subtext: "Cadastre um novo bebê\ne acompanhe os marcos\ndesde o início.",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.homepage);
              },
              child: const BabyLinkCard(
                image: 'images/clipe.png',
                maintext: "Inserir código de convite",
                subtext: "Recebeu um convite?\nInsira o código para acessar\no perfil do bebê.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

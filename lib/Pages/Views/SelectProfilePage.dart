import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projeto_atual/Pages/Login-Signup/login.dart';
import 'package:projeto_atual/Pages/Login-Signup/register.dart';
import 'package:projeto_atual/Pages/Views/Homepage.dart';
import 'package:projeto_atual/Pages/Widgets_em_Uso/ProfileSelectionCard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectProfilePage extends StatelessWidget {
  const SelectProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageTransition(type: PageTransitionType.fade, child: Homepage()),
            );
          },
          child: IconButton(
            icon: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.06,
              child: const Icon(
                Icons.arrow_back, // Versão moderna e centralizada do ícone
                size: 35,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: login(),
                ),
              );
            },
          ),
        ),
        title: Text(
          "Quem está acessando?",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("lib/icons/more.png")),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Homepage(),
                  ),
                );
              },
              child: ProfileSelectionCard(
                image: "images/avatar.jpg",
                maintext: "Mamãe",
                subtext: "Mamãe",
              ),
            ),

            ProfileSelectionCard(
              image: "images/avatar.jpg",
              maintext: "Papai",
              subtext: "Papai",
            ),
            ProfileSelectionCard(
              image: "images/avatar.jpg",
              maintext: "Vovó",
              subtext: "Vovó",
            ),
            ProfileSelectionCard(
              image: "images/avatar.jpg",
              maintext: "Vovô",
              subtext: "Vovô",
            ),
            ProfileSelectionCard(
              image: "images/avatar.jpg",
              maintext: "Babá",
              subtext: "Babá",
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: register(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "+ Adicionar outro cuidador",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    color: Color.fromARGB(255, 3, 190, 150),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

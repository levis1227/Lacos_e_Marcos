import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projeto_atual/Pages/Login-Signup/login.dart';
import 'package:projeto_atual/Pages/Views/Homepage.dart';
import 'package:projeto_atual/Pages/Views/Testando_cod.dart';
import 'package:projeto_atual/Pages/Views/SelectProfilePage.dart';
import 'package:projeto_atual/Pages/Widgets_em_Uso/ProgressoMarcosCard.dart';
import 'package:projeto_atual/Pages/Widgets/article.dart';
import 'package:projeto_atual/Pages/Widgets/banner.dart';
import 'package:projeto_atual/Pages/Widgets_em_Uso/listIcons.dart';
import 'package:projeto_atual/Pages/Widgets/list_doctor1.dart';
import 'package:projeto_atual/Pages/Widgets_em_Uso/profile_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: const Icon(Icons.menu, size: 35),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                child: SelectProfilePage(),
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              child: IconButton(
                icon: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.06,
                  child: const Icon(Icons.notifications_outlined, size: 35),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: SelectProfilePage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
        toolbarHeight: 130,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Olá, Mamãe!",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Que bom ter você aqui!",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
      
          SizedBox(height: 10),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Progresso dos marcos",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Homepage(),
                      ),
                    );
                  },
                  child: Text(
                    "Ver todos",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                    ),
                  ),
                ),
              ],
            ),
          ),
      
          SizedBox(height: 20),
          //Body Start fro here
          ProgressoMarcosCard(
  chartSize: 150, // Altere esse valor para aumentar ou diminuir a roda
  onVerTodosTap: () {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: Homepage(), // Sua página de destino
      ),
    );
  },
),
 GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: CircularPercentPage(),
                  ),
                );
              },
              child: profile_list(
                  image: "images/avatar.jpg",
                  title: "Log out",
                  color: Colors.red,
                ),
            ),
          // Banner Design
          const SizedBox(height: 20),
      
          Padding(
            padding: EdgeInsetsGeometry.directional(top: MediaQuery.of(context).size.height*0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SelectProfilePage(),
                      ),
                    );
                  },
                  child: listIcons(
                    icon: Icons.add,
                    text: "Registrar\nMarco",
                    cor: const Color(0xFF6DB896),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SelectProfilePage(),
                      ),
                    );
                  },
                  child: listIcons(
                    icon: Icons.bar_chart,
                    text: "Ver\ndesenvolvimento",
                    cor: const Color(0xFF71A3DA),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SelectProfilePage(),
                      ),
                    );
                  },
                  child: listIcons(
                    icon: Icons.calendar_month,
                    text: "Agenda",
                    cor: const Color(0xFFF3BA59),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SelectProfilePage(),
                      ),
                    );
                  },
                  child: listIcons(
                    icon: Icons.menu_book,
                    text: "Orientações",
                    cor: const Color(0xFF897CC3),
                  ),
                ),
              ],
            ),
          ),        
        ],
        
      ),
    );
  }
}

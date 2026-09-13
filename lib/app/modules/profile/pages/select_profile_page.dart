import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:projeto_atual/app/widgets/profile_selection_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectProfilePage extends StatelessWidget {
  const SelectProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: const Icon(Icons.arrow_back, size: 35),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.login);
          },
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
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.homepage);
              },
              child: const ProfileSelectionCard(
                image: "images/avatar.jpg",
                maintext: "Mamãe",
                subtext: "Mamãe",
              ),
            ),

            const ProfileSelectionCard(
              image: "images/avatar.jpg",
              maintext: "Papai",
              subtext: "Papai",
            ),
            const ProfileSelectionCard(
              image: "images/avatar.jpg",
              maintext: "Vovó",
              subtext: "Vovó",
            ),
            const ProfileSelectionCard(
              image: "images/avatar.jpg",
              maintext: "Vovô",
              subtext: "Vovô",
            ),
            const ProfileSelectionCard(
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
                  Navigator.pushReplacementNamed(context, RoutesName.register);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "+ Adicionar outro cuidador",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    color: const Color.fromARGB(255, 3, 190, 150),
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

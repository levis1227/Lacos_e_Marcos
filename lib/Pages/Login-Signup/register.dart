import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projeto_atual/Pages/Login-Signup/login.dart';
import 'package:projeto_atual/Pages/Widgets/Auth_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: const Icon(
              Icons.arrow_back, // Versão moderna e centralizada do ícone
              size: 35,
            ),
          ),
        onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: 
        Text(
          "Criar conta",
          style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Auth_text_field(text: "Digite seu nome", icon: Icons.person),
          const SizedBox(
            height: 5,
          ),
          Auth_text_field(text: "Digite seu e-mail", icon: Icons.email),
          const SizedBox(
            height: 5,
          ),
          Auth_text_field(
              text: "Digite sua senha", icon: Icons.lock),
          const SizedBox(
            height: 5,
          ),
          Auth_text_field(
              text: "Confirme sua senha", icon: Icons.lock),
          SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              onPressed: () {
                // Perform verification or other actions here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 3, 190, 150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Criar conta",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Já tem uma conta? ",
                style:
                    GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black87),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: login()));
                },
                child: Text(
                  "Entrar",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: const Color.fromARGB(255, 3, 190, 150),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}

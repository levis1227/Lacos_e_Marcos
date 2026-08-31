import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_atual/Pages/Widgets/Auth_text_field.dart';
import 'package:projeto_atual/const/Lacos_e_Marcos_3.dart';
import 'package:projeto_atual/const/routes/routes_names.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class login extends StatelessWidget {
  const login({super.key});

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
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset("images/Logo.png", fit: BoxFit.contain),
            ),
            const SizedBox(height: 20),
            const LacosEMarcos3(),
            const SizedBox(height: 40),
            Auth_text_field(text: "Email", icon: Icons.email),
            const SizedBox(height: 5),
            Auth_text_field(text: "Senha", icon: Icons.lock),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesName.selectProfile,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 3, 190, 150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Entrar",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.forgotPass);
                  },
                  child: Text(
                    "Esqueci minha senha",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ainda não tem uma conta? ",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Colors.black87,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.register);
                  },
                  child: Text(
                    "Criar conta",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

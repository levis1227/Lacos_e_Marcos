import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projeto_atual/const/Lacos_e_Marcos_1.dart';
import 'package:projeto_atual/const/routes/routes_names.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Screen1State();
}

class _Screen1State extends State<Page1> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return; // Proteção contra troca de tela rápida
      Navigator.pushReplacementNamed(context, RoutesName.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem do Logo
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(
                "images/Logo.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20), // Espaçamento entre o Logo e o Texto
            
            // Texto do Título
            const LacosEMarcos(),
          ],
        ),
      ),
    );
  }
}
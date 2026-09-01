import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/constants/lacos_e_marcos_1.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Inicia o timer de 3 segundos para redirecionar para o onboarding
    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, RoutesName.onboarding);
    });
  }

  @override
  void dispose() {
    // Cancela o timer se a tela for fechada antes dos 3 segundos para evitar vazamento de memória
    _timer?.cancel();
    super.dispose();
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
            // Imagem da Logo
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(
                "images/Logo.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            
            // Texto/Widget de Título
            const LacosEMarcos(),
          ],
        ),
      ),
    );
  }
}
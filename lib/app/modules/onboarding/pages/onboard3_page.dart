import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/constants/lacos_e_marcos_3.dart';

class Onboard3Page extends StatelessWidget {
  const Onboard3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 40),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    "images/mother1.png", // Altere a imagem se essa etapa utilizar outra
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(height: 0),
                const LacosEMarcos3(), // Atualizado para a constante da página 3
              ],
            ),
          ),
        ],
      ),
    );
  }
}

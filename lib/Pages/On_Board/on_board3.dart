import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_atual/const/Lacos_e_Marcos_1.dart';
import 'package:projeto_atual/const/Lacos_e_Marcos_2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class on_board3 extends StatelessWidget {
  const on_board3({super.key});

    @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  "images/mother1.png",
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
              const SizedBox(height: 0), // Espaçamento entre a imagem e o texto
              const LacosEMarcos2(),
            ],
          ),
        )
      ]),
    );
  }
}


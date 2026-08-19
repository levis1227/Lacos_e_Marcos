import 'package:flutter/material.dart';

class LacosEMarcos3 extends StatelessWidget {
  const LacosEMarcos3({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          // "Laços\n" (Verde)
          TextSpan(
            text: 'Laços\n',
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Color(0xFF75B798),
              height: 1.1,
            ),
          ),
          // "e " (Amarelo / Laranja)
          TextSpan(
            text: 'e ',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFDC16D),
            ),
          ),
          // "Marcos!" (Azul)
          TextSpan(
            text: 'Marcos',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7EB0D5),
            ),
          ),
        ],
      ),
    );
  }
}
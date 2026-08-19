import 'package:flutter/material.dart';

class LacosEMarcos extends StatelessWidget {
  const LacosEMarcos({super.key});

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
              fontSize: 90,
              fontWeight: FontWeight.bold,
              color: Color(0xFF75B798),
              height: 1.1,
            ),
          ),
          // "e " (Amarelo / Laranja)
          TextSpan(
            text: 'e ',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFDC16D),
            ),
          ),
          // "Marcos!" (Azul)
          TextSpan(
            text: 'Marcos',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7EB0D5),
            ),
          ),
        ],
      ),
    );
  }
}
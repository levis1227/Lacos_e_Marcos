import 'package:flutter/material.dart';

class LacosEMarcos2 extends StatelessWidget {
  const LacosEMarcos2({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          // "Laços\n" (Verde)
          TextSpan(
            text: 'Bem-vindo(a) ao\n',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
          TextSpan(
            text: 'Laços ',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7EB0D5),
              height: 1.3,
            ),
          ),
          // "e " (Amarelo / Laranja)
          TextSpan(
            text: 'e ',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              color: Color(0xFF75B798),
            ),
          ),
          // "Marcos!" (Azul)
          TextSpan(
            text: 'Marcos!\n',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7EB0D5),
            ),
          ),
          TextSpan(
            text: '\nAcompanhe cada conquista\nreceba orientações e receba\nesse laço de amor.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              height: 1.3,
            ),
          ),
        ],
      ),
      
    );
  }
}
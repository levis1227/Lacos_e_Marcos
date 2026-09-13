import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/constants/lacos_e_marcos_2.dart';

class Onboard1Page extends StatelessWidget {
  const Onboard1Page({super.key});

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
                    "images/mother1.png",
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(height: 0),
                const LacosEMarcos2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CircularPercentPage extends StatelessWidget {
  const CircularPercentPage({super.key});

  static const String routeName = '/circular-percent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F6),
      appBar: AppBar(
        title: const Text("Circular Percent Indicators"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Cabeçalho Card
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Progresso dos marcos",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Ver todos",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6BB285),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Conteúdo: Gráfico Multi-Segmento + Legenda
              
            ],
          ),
        ),
      ),
    );
  }
}



 
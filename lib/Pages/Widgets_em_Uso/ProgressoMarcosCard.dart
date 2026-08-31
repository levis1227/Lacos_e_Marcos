import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressoMarcosCard extends StatelessWidget {
  final VoidCallback? onVerTodosTap;
  final double? width;        // Largura total do card
  final double chartSize;     // Tamanho do gráfico circular (largura/altura)
  final double ringThickness; // Espessura da rosca

  const ProgressoMarcosCard({
    super.key,
    this.onVerTodosTap,
    this.width,
    this.chartSize = 90.0,       // Tamanho padrão compacto
    this.ringThickness = 15.0,   // Espessura padrão
  });

  @override
  Widget build(BuildContext context) {
    // Cálculo automático do raio interno para o texto caber perfeitamente
    final double centerRadius = (chartSize / 2) - ringThickness;

    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Row(
            children: [
              // Gráfico com tamanho ajustável
              SizedBox(
                width: chartSize,
                height: chartSize,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: centerRadius > 0 ? centerRadius : 20,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(
                            color: const Color(0xFF6BB285),
                            value: 10,
                            showTitle: false,
                            radius: ringThickness,
                          ),
                          PieChartSectionData(
                            color: const Color(0xFFF3C258),
                            value: 6,
                            showTitle: false,
                            radius: ringThickness,
                          ),
                          PieChartSectionData(
                            color: const Color(0xFFE2EBE2),
                            value: 2,
                            showTitle: false,
                            radius: ringThickness,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "65%",
                            style: GoogleFonts.inter(
                              fontSize: chartSize * 0.18, // Fonte proporcional
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "dos marcos\nalcançados",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: chartSize * 0.08, // Fonte proporcional
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              // Legenda Lateral
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _LegendItem(
                      color: Color(0xFF6BB285),
                      label: "Concluídos",
                      value: "10",
                    ),
                    SizedBox(height: 8),
                    _LegendItem(
                      color: Color(0xFFF3C258),
                      label: "Em desenvolvimento",
                      value: "6",
                    ),
                    SizedBox(height: 8),
                    _LegendItem(
                      color: Color(0xFFEB6055),
                      label: "Atenção",
                      value: "2",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
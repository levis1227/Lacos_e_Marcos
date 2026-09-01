import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';

class ProgressoMarcosCard extends StatelessWidget {
  final VoidCallback? onVerTodosTap;
  final double? width;
  final double chartSize;
  final double ringThickness;

  const ProgressoMarcosCard({
    super.key,
    this.onVerTodosTap,
    this.width,
    this.chartSize = 90.0,
    this.ringThickness = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final double centerRadius = (chartSize / 2) - ringThickness;

    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
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
              // Gráfico circular com fl_chart
              SizedBox(
                width: chartSize,
                height: chartSize,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius:
                            centerRadius > 0 ? centerRadius : 20,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(
                            color: AppColors.green,
                            value: 10,
                            showTitle: false,
                            radius: ringThickness,
                          ),
                          PieChartSectionData(
                            color: AppColors.orange,
                            value: 6,
                            showTitle: false,
                            radius: ringThickness,
                          ),
                          PieChartSectionData(
                            color: AppColors.red,
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
                            style: textTheme.titleMedium?.copyWith(
                              fontSize: chartSize * 0.18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            "dos marcos\nalcançados",
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: chartSize * 0.08,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
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
                      color: AppColors.green,
                      label: "Concluídos",
                      value: "10",
                    ),
                    SizedBox(height: 8),
                    _LegendItem(
                      color: AppColors.orange,
                      label: "Em desenvolvimento",
                      value: "6",
                    ),
                    SizedBox(height: 8),
                    _LegendItem(
                      color: AppColors.red,
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
    final textTheme = Theme.of(context).textTheme;

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
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          value,
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
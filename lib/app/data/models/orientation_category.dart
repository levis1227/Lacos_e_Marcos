import 'package:flutter/material.dart';

enum OrientationCategoryType { estimulacao, sinaisDeAlerta, cuidadosGerais, vacinacao }

class OrientationCategory {
  final OrientationCategoryType type;
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const OrientationCategory({
    required this.type,
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  static const List<OrientationCategory> defaults = [
    OrientationCategory(
      type: OrientationCategoryType.estimulacao,
      title: 'Estimulação',
      description: 'Dicas simples para ajudar no desenvolvimento do bebê.',
      icon: Icons.toys,
      backgroundColor: Color(0xFFDCEFE3),
      iconColor: Color(0xFF4CAF7D),
    ),
    OrientationCategory(
      type: OrientationCategoryType.sinaisDeAlerta,
      title: 'Sinais de alerta',
      description: 'Fique atento a sinais que podem indicar atrasos.',
      icon: Icons.warning_amber_rounded,
      backgroundColor: Color(0xFFFBE2DE),
      iconColor: Color(0xFFE0745B),
    ),
    OrientationCategory(
      type: OrientationCategoryType.cuidadosGerais,
      title: 'Cuidados gerais',
      description: 'Cuidados importantes para a saúde e bem-estar.',
      icon: Icons.shield_outlined,
      backgroundColor: Color(0xFFDCE7F5),
      iconColor: Color(0xFF5B8DD1),
    ),
    OrientationCategory(
      type: OrientationCategoryType.vacinacao,
      title: 'Vacinação',
      description: 'Calendário vacinal e informações importantes.',
      icon: Icons.vaccines_outlined,
      backgroundColor: Color(0xFFF7E7D2),
      iconColor: Color(0xFFD9A356),
    ),
  ];
}
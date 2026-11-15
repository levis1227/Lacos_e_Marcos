import 'package:flutter/material.dart';

abstract class AppColors {
  // Paleta principal da marca (Preservadas)
  static const Color green = Color(0xFF75B798); // Verde do "Laços"
  static const Color orange = Color(0xFFFDC16D); // Amarelo/Laranja do "e"
  static const Color blue = Color(0xFF7EB0D5); // Azul do "Marcos"
  static const Color primaryButton = Color(
    0xFF03BE96,
  ); // Verde do botão "Próximo/Começar"

  // Cores de apoio e texto (Preservadas)
  static const Color textSecondary = Colors.black54;
  static const Color background = Colors.white;
  static const Color dotInactive = Color(0xFFAAFFED);

  // Adições para Dashboard, Perfil e Categorias (Sem alterar as existentes)
  static const Color textPrimary = Color(0xFF2E2E2E);
  static const Color purple = Color(0xFF897CC3);
  static const Color red = Colors.redAccent;
  static const Color cardBackground = Color(0xFFF8F8F8);
  static const Color greenLight = Color(0xFFE3F3EA); // Fundo suave verde (módulo Memórias)

  // Botões Desativados e Não Selecionados
  static const Color disabledButton = Color(0xFFE0E0E0); // Cinza para fundo de botão inativo/desativado
  static const Color textDisabled = Color(0xFF9E9E9E); // Cinza para texto/ícone em estado desativado
}
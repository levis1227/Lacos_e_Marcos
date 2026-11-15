import 'package:flutter/material.dart';
import 'orientation_category.dart';

class OrientationContent {
  final String id;
  final OrientationCategoryType categoryType;
  final IconData headerIcon;
  final String headerLabel; 
  final String illustrationUrl;
  final String articleTitle; 
  final String bodyText;
  final List<String> tips;

  const OrientationContent({
    required this.id,
    required this.categoryType,
    required this.headerIcon,
    required this.headerLabel,
    required this.illustrationUrl,
    required this.articleTitle,
    required this.bodyText,
    required this.tips,
  });
}
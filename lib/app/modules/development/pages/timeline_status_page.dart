import 'package:flutter/material.dart';
import 'package:projeto_atual/app/data/providers/marcos_data.dart';
import 'package:projeto_atual/app/modules/development/pages/resumo_page.dart';
import 'package:projeto_atual/app/modules/development/pages/timeline_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/data/models/marco_model.dart';


class TimelineStatusPage extends StatefulWidget {
  const TimelineStatusPage({super.key});

  @override
  State<TimelineStatusPage> createState() => _TimelineStatusPageState();
}

class _TimelineStatusPageState extends State<TimelineStatusPage> {
  int _selectedTab = 0;

  final List<MarcoModel> _marcosData = marcosData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Desenvolvimento'),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.background),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildToggleButton(
                      text: "Linha do Tempo",
                      isSelected: _selectedTab == 0,
                      onTap: () => setState(() => _selectedTab = 0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: _buildToggleButton(
                      text: "Resumo",
                      isSelected: _selectedTab == 1,
                      onTap: () => setState(() => _selectedTab = 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: _selectedTab == 0
                  ? TimelinePage(data: _marcosData)
                  : const ResumoView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 1.2.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green : AppColors.disabledButton,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textDisabled,
          ),
        ),
      ),
    );
  }
}
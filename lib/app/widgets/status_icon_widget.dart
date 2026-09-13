import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/data/models/marco_model.dart';

class StatusIconWidget extends StatelessWidget {
  final TimelineStatus status;

  const StatusIconWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == TimelineStatus.done) {
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: AppColors.green,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 16),
      );
    } else if (status == TimelineStatus.inProgress) {
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Color(0xFFE5A800),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.priority_high, color: Colors.white, size: 16),
      );
    }

    return const SizedBox.shrink();
  }
}
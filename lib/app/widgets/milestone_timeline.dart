import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:projeto_atual/app/data/models/milestone.dart';

class MilestoneTimeline extends StatelessWidget {
  final List<Milestone> milestones; 
  final void Function(Milestone)? onTap;

  const MilestoneTimeline({super.key, required this.milestones, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (milestones.isEmpty) {
      return const Center(child: Text('Nenhum marco registrado ainda'));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: milestones.length,
      itemBuilder: (context, index) {
        final milestone = milestones[index];
        final isLast = index == milestones.length - 1;
        return _TimelineEntry(
          milestone: milestone,
          isLast: isLast,
          onTap: () => onTap?.call(milestone),
        );
      },
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final Milestone milestone;
  final bool isLast;
  final VoidCallback? onTap;

  const _TimelineEntry({
    required this.milestone,
    required this.isLast,
    this.onTap,
  });

  String _formatDateLabel(DateTime date) {
    final now = DateTime.now();
    final isToday = date.year == now.year && date.month == now.month && date.day == now.day;
    final formatted = DateFormat('dd/MM/yyyy').format(date);
    return isToday ? 'Hoje - $formatted' : formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(
                color: AppColors.primaryButton,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Expanded(
                child: Container(
                  width: 2,
                  color: AppColors.greenLight,
                ),
              ),
          ],
        ),
        const SizedBox(width: 12),
        // Conteúdo (data + card)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatDateLabel(milestone.achievedDate),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            milestone.imageUrl,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                milestone.title,
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Geralmente entre ${milestone.ageRange}',
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.expand_more, color: Colors.grey.shade400),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
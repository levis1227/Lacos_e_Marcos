import 'package:flutter/material.dart';
import 'package:projeto_atual/app/widgets/status_icon_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timelines_plus/timelines_plus.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/data/models/marco_model.dart';

class TimelinePage extends StatelessWidget {
  final List<MarcoModel> data;

  const TimelinePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      physics: const ClampingScrollPhysics(),
      theme: TimelineThemeData(
        nodePosition: 0,
        color: Colors.grey.shade300,
        connectorTheme: const ConnectorThemeData(thickness: 3.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      builder: TimelineTileBuilder.connected(
        connectorBuilder: (_, index, __) {
          final isCurrentDone = data[index].status == TimelineStatus.done ||
              data[index].status == TimelineStatus.inProgress;
          final isNextDone = index + 1 < data.length &&
              (data[index + 1].status == TimelineStatus.done ||
                  data[index + 1].status == TimelineStatus.inProgress);

          return SolidLineConnector(
            color: (isCurrentDone && isNextDone)
                ? AppColors.green
                : const Color(0xFFE2E2E2),
          );
        },
        indicatorBuilder: (context, index) {
          final isDoneOrProgress =
              data[index].status == TimelineStatus.done ||
                  data[index].status == TimelineStatus.inProgress;

          return DotIndicator(
            size: 16.sp,
            color: isDoneOrProgress ? AppColors.green : const Color(0xFFCCCCCC),
          );
        },
        contentsBuilder: (context, index) {
          final item = data[index];
          final isFirstItem = index == 0;

          return Container(
            padding: EdgeInsets.only(left: 4.w, top: 1.5.h, bottom: 1.5.h),
            decoration: BoxDecoration(
              border: Border(
                top: isFirstItem
                    ? const BorderSide(color: Color(0xFFE2E2E2), width: 1.0)
                    : BorderSide.none,
                bottom: const BorderSide(color: Color(0xFFE2E2E2), width: 1.0),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.idade,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                      SizedBox(height: 0.3.h),
                      Text(
                        item.titulo,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 0.3.h),
                      Text(
                        item.dataRegistro,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                StatusIconWidget(status: item.status),
              ],
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
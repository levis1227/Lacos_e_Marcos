enum ContentType { todos, fotos, videos, marcos }
enum PeriodFilter { todos, ultimos7Dias, ultimos30Dias, personalizado }
enum VisibilityFilter { todos, somenteEu, compartilhadoComigo }

class MemoryFilter {
  final ContentType contentType;
  final PeriodFilter period;
  final DateTime? customStartDate;
  final DateTime? customEndDate;
  final String? milestoneId; // null = "Todos os marcos"
  final VisibilityFilter visibility;

  const MemoryFilter({
    this.contentType = ContentType.todos,
    this.period = PeriodFilter.todos,
    this.customStartDate,
    this.customEndDate,
    this.milestoneId,
    this.visibility = VisibilityFilter.todos,
  });

  MemoryFilter copyWith({
    ContentType? contentType,
    PeriodFilter? period,
    DateTime? customStartDate,
    DateTime? customEndDate,
    String? milestoneId,
    VisibilityFilter? visibility,
  }) {
    return MemoryFilter(
      contentType: contentType ?? this.contentType,
      period: period ?? this.period,
      customStartDate: customStartDate ?? this.customStartDate,
      customEndDate: customEndDate ?? this.customEndDate,
      milestoneId: milestoneId ?? this.milestoneId,
      visibility: visibility ?? this.visibility,
    );
  }
}
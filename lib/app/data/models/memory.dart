class Memory {
  final String id;
  final String imageUrl;
  final MemoryType type; // foto video e marco
  final DateTime date;
  final bool isFavorite;

  // so usado em detalhes das memorias
  final String? milestoneTitle;
  final String? milestoneAgeRange;
  final String? description;
  final List<String>? likedByAvatars;
  final int? extraLikesCount;

  Memory({
    required this.id,
    required this.imageUrl,
    required this.type,
    required this.date,
    this.isFavorite = false,
    this.milestoneTitle,
    this.milestoneAgeRange,
    this.description,
    this.likedByAvatars,
    this.extraLikesCount,
  });
}

enum MemoryType { foto, video, marco }
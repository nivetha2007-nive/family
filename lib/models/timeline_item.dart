/// Model for timeline events in their story
class TimelineItem {
  final String title;
  final String year;
  final String description;
  final String? imagePath;
  
  TimelineItem({
    required this.title,
    required this.year,
    required this.description,
    this.imagePath,
  });
}

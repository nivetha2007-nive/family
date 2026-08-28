/// Model for timeline events in their story
class TimelineItem {
  final String title;
  final String year;
  final String description;
  final String? imagePath;
  final bool isPlaceholder;
  final String placeholderText;
  
  TimelineItem({
    required this.title,
    required this.year,
    required this.description,
    this.imagePath,
    this.isPlaceholder = false,
    this.placeholderText = 'Add your photo here',
  });
}

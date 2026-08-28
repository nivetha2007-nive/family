/// Model for video memories
class VideoMemory {
  final String videoPath;
  final String? thumbnailPath;
  final String title;
  final String? description;
  final String? date;
  final String? duration;
  
  VideoMemory({
    required this.videoPath,
    this.thumbnailPath,
    required this.title,
    this.description,
    this.date,
    this.duration,
  });
}

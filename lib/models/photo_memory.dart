/// Model for photo memories
class PhotoMemory {
  final String imagePath;
  final String? caption;
  final String? category;
  final String? date;
  
  PhotoMemory({
    required this.imagePath,
    this.caption,
    this.category,
    this.date,
  });
}

/// Photo categories
enum PhotoCategory {
  wedding('Wedding'),
  family('Family'),
  vacations('Vacations'),
  celebrations('Celebrations'),
  everyday('Everyday Moments'),
  special('Special Moments'),
  twentyYears('20 Years');
  
  final String displayName;
  const PhotoCategory(this.displayName);
}

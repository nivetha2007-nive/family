import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_theme.dart';
import '../constants/animation_config.dart';
import '../models/photo_memory.dart';
import '../widgets/memory_app_wrapper.dart';
import '../widgets/anniversary_app_bar.dart';
import 'photo_viewer_screen.dart';

/// Photo memories gallery with categories
class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  
  // Simple photo gallery - 27 photos with easy numbering
  final List<PhotoMemory> _allPhotos = List.generate(
    27,
    (index) => PhotoMemory(
      imagePath: 'assets/images/gallery/${index + 1}.jpg',
      caption: 'Memory ${index + 1}',
      category: 'Family Memories',
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MemoryAppWrapper(
      intensity: AnimationIntensity.subtle,
      quotePosition: QuotePosition.topCenter,
      child: Scaffold(
        backgroundColor: AppColors.creamBackground,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              AnniversaryAppBar(
                title: 'Photo Memories',
                subtitle: '27 Cherished Moments',
                icon: Icons.photo_library,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _buildPhotoCard(_allPhotos[index], index, _allPhotos);
                    },
                    childCount: _allPhotos.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoCard(PhotoMemory photo, int index, List<PhotoMemory> allPhotos) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PhotoViewerScreen(
              photos: allPhotos,
              initialIndex: index,
            ),
          ),
        );
      },
      child: Hero(
        tag: 'photo_${photo.imagePath}',
        child: Container(
          decoration: AppTheme.cardDecoration.copyWith(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Photo image or placeholder
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.warmBeige,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    border: Border.all(
                      color: AppColors.gold.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.asset(
                      photo.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Show placeholder if image not found
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 48,
                                    color: AppColors.mediumText.withOpacity(0.3),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      'Add photo ${index + 1}.jpg',
                                      style: AppTypography.caption.copyWith(
                                        color: AppColors.mediumText.withOpacity(0.5),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              
              // Caption
              if (photo.caption != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photo.caption!,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.darkText,
                          fontSize: 11,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (photo.date != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          photo.date!,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.lightText,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

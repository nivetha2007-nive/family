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

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // Placeholder photo data - user will replace with actual photos
  final Map<PhotoCategory, List<PhotoMemory>> _photosByCategory = {
    PhotoCategory.wedding: List.generate(
      6,
      (index) => PhotoMemory(
        imagePath: 'assets/images/wedding_${index + 1}.jpg',
        caption: 'Wedding photo ${index + 1} - Add your caption here',
        category: PhotoCategory.wedding.displayName,
        date: '03 Sep 2006',
      ),
    ),
    PhotoCategory.family: List.generate(
      8,
      (index) => PhotoMemory(
        imagePath: 'assets/images/family_${index + 1}.jpg',
        caption: 'Family moment ${index + 1} - Add your caption here',
        category: PhotoCategory.family.displayName,
      ),
    ),
    PhotoCategory.vacations: List.generate(
      6,
      (index) => PhotoMemory(
        imagePath: 'assets/images/vacation_${index + 1}.jpg',
        caption: 'Vacation memory ${index + 1} - Add your caption here',
        category: PhotoCategory.vacations.displayName,
      ),
    ),
    PhotoCategory.celebrations: List.generate(
      6,
      (index) => PhotoMemory(
        imagePath: 'assets/images/celebration_${index + 1}.jpg',
        caption: 'Celebration ${index + 1} - Add your caption here',
        category: PhotoCategory.celebrations.displayName,
      ),
    ),
    PhotoCategory.everyday: List.generate(
      10,
      (index) => PhotoMemory(
        imagePath: 'assets/images/everyday_${index + 1}.jpg',
        caption: 'Everyday moment ${index + 1} - Add your caption here',
        category: PhotoCategory.everyday.displayName,
      ),
    ),
    PhotoCategory.special: List.generate(
      8,
      (index) => PhotoMemory(
        imagePath: 'assets/images/special_${index + 1}.jpg',
        caption: 'Special moment ${index + 1} - Add your caption here',
        category: PhotoCategory.special.displayName,
      ),
    ),
    PhotoCategory.twentyYears: List.generate(
      4,
      (index) => PhotoMemory(
        imagePath: 'assets/images/twenty_years_${index + 1}.jpg',
        caption: '20 years together - Photo ${index + 1}',
        category: PhotoCategory.twentyYears.displayName,
        date: '2026',
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: PhotoCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                AnniversaryAppBar(
                  title: 'Photo Memories',
                  subtitle: 'Cherished Moments',
                  icon: Icons.photo_library,
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverTabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: AppColors.gold,
                      indicatorWeight: 3,
                      labelColor: AppColors.primaryBurgundy,
                      unselectedLabelColor: AppColors.mediumText,
                      labelStyle: AppTypography.label.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      unselectedLabelStyle: AppTypography.label.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                      tabs: PhotoCategory.values.map((category) {
                        return Tab(text: category.displayName);
                      }).toList(),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: PhotoCategory.values.map((category) {
                return _buildPhotoGrid(category);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoGrid(PhotoCategory category) {
    final photos = _photosByCategory[category] ?? [];

    if (photos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_album_outlined,
              size: 64,
              color: AppColors.mediumText.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No photos yet',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.mediumText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add your ${category.displayName.toLowerCase()} photos here',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.lightText,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return _buildPhotoCard(photos[index], index, photos);
      },
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
              // Photo placeholder
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
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Placeholder icon
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
                                'Add photo',
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.mediumText.withOpacity(0.5),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Gradient overlay
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                AppColors.black.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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

/// Custom delegate for the tab bar
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.creamBackground,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}

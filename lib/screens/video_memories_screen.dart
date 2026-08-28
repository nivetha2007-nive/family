import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../constants/animation_config.dart';
import '../models/video_memory.dart';
import '../widgets/memory_app_wrapper.dart';
import 'video_player_screen.dart';

/// Video memories screen with list of videos
class VideoMemoriesScreen extends StatefulWidget {
  const VideoMemoriesScreen({super.key});

  @override
  State<VideoMemoriesScreen> createState() => _VideoMemoriesScreenState();
}

class _VideoMemoriesScreenState extends State<VideoMemoriesScreen>
    with AutomaticKeepAliveClientMixin {
  // Placeholder video data - user will replace with actual videos
  final List<VideoMemory> _videos = [
    VideoMemory(
      videoPath: 'assets/videos/wedding_ceremony.mp4',
      thumbnailPath: 'assets/videos/thumbnails/wedding_ceremony.jpg',
      title: 'Wedding Ceremony',
      description: 'The beautiful moments from our wedding day ceremony',
      date: '03 Sep 2006',
      duration: '5:30',
    ),
    VideoMemory(
      videoPath: 'assets/videos/wedding_reception.mp4',
      thumbnailPath: 'assets/videos/thumbnails/wedding_reception.jpg',
      title: 'Wedding Reception',
      description: 'Celebrations and joy at the wedding reception',
      date: '03 Sep 2006',
      duration: '8:15',
    ),
    VideoMemory(
      videoPath: 'assets/videos/family_moments.mp4',
      thumbnailPath: 'assets/videos/thumbnails/family_moments.jpg',
      title: 'Family Moments',
      description: 'Beautiful family time together',
      date: '2015',
      duration: '3:45',
    ),
    VideoMemory(
      videoPath: 'assets/videos/vacation_memories.mp4',
      thumbnailPath: 'assets/videos/thumbnails/vacation_memories.jpg',
      title: 'Vacation Memories',
      description: 'Memorable trips and adventures together',
      date: '2018',
      duration: '6:20',
    ),
    VideoMemory(
      videoPath: 'assets/videos/celebrations.mp4',
      thumbnailPath: 'assets/videos/thumbnails/celebrations.jpg',
      title: 'Celebrations',
      description: 'Special celebrations and milestones',
      date: '2020',
      duration: '4:10',
    ),
    VideoMemory(
      videoPath: 'assets/videos/everyday_life.mp4',
      thumbnailPath: 'assets/videos/thumbnails/everyday_life.jpg',
      title: 'Everyday Life',
      description: 'The simple, beautiful moments of daily life',
      date: '2022',
      duration: '2:50',
    ),
    VideoMemory(
      videoPath: 'assets/videos/anniversary_message.mp4',
      thumbnailPath: 'assets/videos/thumbnails/anniversary_message.jpg',
      title: '20th Anniversary Message',
      description: 'A special message for 20 wonderful years',
      date: '2026',
      duration: '3:00',
    ),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return MemoryAppWrapper(
      intensity: AnimationIntensity.subtle,
      quotePosition: QuotePosition.topCenter,
      child: Scaffold(
      backgroundColor: AppColors.creamBackground,
      body: CustomScrollView(
        slivers: [
          // App bar
          SliverAppBar(
            expandedHeight: 140,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.primaryBurgundy,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Video Memories',
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.whiteText,
                  fontSize: 22,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Icon(
                        Icons.video_library,
                        size: 42,
                        color: AppColors.whiteText.withOpacity(0.9),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Video list
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildVideoCard(_videos[index]);
                },
                childCount: _videos.length,
              ),
            ),
          ),

          // Bottom spacing
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 100),
          ),
        ],
      ),
        ),
    );
  }

  Widget _buildVideoCard(VideoMemory video) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(video: video),
            ),
          );
        },
        child: Container(
          decoration: AppTheme.elegantCardDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Video thumbnail
              Stack(
                children: [
                  // Thumbnail placeholder
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.warmBeige,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
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
                                  Icons.videocam_outlined,
                                  size: 64,
                                  color: AppColors.mediumText.withOpacity(0.3),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Video Thumbnail',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.mediumText.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Gradient overlay
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
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
                  
                  // Play button overlay
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: AppColors.primaryBurgundy.withOpacity(0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryBurgundy.withOpacity(0.4),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 42,
                          color: AppColors.whiteText,
                        ),
                      ),
                    ),
                  ),
                  
                  // Duration badge
                  if (video.duration != null)
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          video.duration!,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              
              // Video details
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      video.title,
                      style: AppTextStyles.heading3.copyWith(
                        color: AppColors.primaryBurgundy,
                        fontSize: 18,
                      ),
                    ),
                    
                    if (video.date != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: AppColors.gold,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            video.date!,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.mediumText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                    
                    if (video.description != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        video.description!,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.darkText,
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    
                    const SizedBox(height: 16),
                    
                    // Watch button
                    Row(
                      children: [
                        const Icon(
                          Icons.play_circle_outline,
                          size: 20,
                          color: AppColors.primaryBurgundy,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Tap to watch',
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.primaryBurgundy,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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

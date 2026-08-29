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
  // Your 10 family memory videos
  final List<VideoMemory> _videos = [
    VideoMemory(
      videoPath: 'assets/videos/memories/video_01.mp4',
      thumbnailPath: null,
      title: 'Memory 1',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_02.mp4',
      thumbnailPath: null,
      title: 'Memory 2',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_03.mp4',
      thumbnailPath: null,
      title: 'Memory 3',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_04.mp4',
      thumbnailPath: null,
      title: 'Memory 4',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_05.mp4',
      thumbnailPath: null,
      title: 'Memory 5',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_06.mp4',
      thumbnailPath: null,
      title: 'Memory 6',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_07.mp4',
      thumbnailPath: null,
      title: 'Memory 7',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_08.mp4',
      thumbnailPath: null,
      title: 'Memory 8',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_09.mp4',
      thumbnailPath: null,
      title: 'Memory 9',
      description: 'A special family moment',
      date: null,
      duration: null,
    ),
    VideoMemory(
      videoPath: 'assets/videos/memories/video_10.mp4',
      thumbnailPath: null,
      title: 'Memory 10',
      description: 'A special family moment',
      date: null,
      duration: null,
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

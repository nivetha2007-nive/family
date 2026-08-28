import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../constants/animation_config.dart';
import '../models/timeline_item.dart';
import '../widgets/decorative_divider.dart';
import '../widgets/memory_app_wrapper.dart';

/// Their story timeline screen
/// Shows the journey through 20 years together
class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;

  // Placeholder timeline data - user will replace with actual content
  final List<TimelineItem> _timelineItems = [
    TimelineItem(
      title: 'The Beginning',
      year: '2004',
      description:
          'Every love story has a beginning. This is where it all started...\n\n[You will replace this with your actual story and dates]',
      imagePath: null, // User will provide actual image
    ),
    TimelineItem(
      title: 'Their Wedding Day',
      year: '2006',
      description:
          '03 September 2006\nPariya Kovil, Cuddalore\n\nThe day two hearts became one.\n\n[Add your wedding day memories here]',
      imagePath: null,
    ),
    TimelineItem(
      title: 'Early Years',
      year: '2006-2010',
      description:
          'Building a life together, learning, growing, and creating their first memories as husband and wife.\n\n[Add details about these early years]',
      imagePath: null,
    ),
    TimelineItem(
      title: 'Growing Family',
      year: '2010s',
      description:
          'New chapters, new blessings, and the joy of parenthood.\n\n[Add details about family milestones]',
      imagePath: null,
    ),
    TimelineItem(
      title: 'Special Moments',
      year: '2010-2020',
      description:
          'Vacations, celebrations, everyday joys, and the memories that make a lifetime.\n\n[Add your favorite moments]',
      imagePath: null,
    ),
    TimelineItem(
      title: 'Together Through It All',
      year: '2020-2026',
      description:
          'Through challenges and triumphs, their love remained constant.\n\n[Add recent years\' memories]',
      imagePath: null,
    ),
    TimelineItem(
      title: 'Today - 20 Years Together',
      year: '2026',
      description:
          'Twenty years of love, laughter, partnership, and unwavering commitment.\n\nA journey that continues...',
      imagePath: null,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MemoryAppWrapper(
      intensity: AnimationIntensity.subtle,
      quotePosition: QuotePosition.topCenter,
      child: Scaffold(
      backgroundColor: Colors.transparent, // Changed to transparent to show animations
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.creamBackground,
              AppColors.lightCream,
            ],
          ),
        ),
        child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // App bar
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.primaryBurgundy,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Their Story',
                style: AppTextStyles.heading2.copyWith(
                  color: AppColors.whiteText,
                  fontSize: 24,
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
                      const SizedBox(height: 40),
                      Icon(
                        Icons.favorite,
                        size: 48,
                        color: AppColors.whiteText.withOpacity(0.9),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'A Journey of Love',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.whiteText.withOpacity(0.9),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Timeline content
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildTimelineItem(
                    _timelineItems[index],
                    index,
                    index == _timelineItems.length - 1,
                  );
                },
                childCount: _timelineItems.length,
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
        ),
    );
  }

  Widget _buildTimelineItem(
    TimelineItem item,
    int index,
    bool isLast,
  ) {
    final isLeft = index % 2 == 0;

    return FadeTransition(
      opacity: _controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isLeft) ...[
              Expanded(
                child: _buildTimelineCard(item, isLeft),
              ),
              const SizedBox(width: 16),
              _buildTimelineLine(item.year, isLast),
              const SizedBox(width: 16),
              const Expanded(child: SizedBox()),
            ] else ...[
              const Expanded(child: SizedBox()),
              const SizedBox(width: 16),
              _buildTimelineLine(item.year, isLast),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTimelineCard(item, isLeft),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineCard(TimelineItem item, bool isLeft) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: AppTheme.elegantCardDecoration,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            item.title,
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.primaryBurgundy,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 12),

          // Divider
          const OrnamentalDivider(
            color: AppColors.gold,
            thickness: 1.5,
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            item.description,
            style: AppTextStyles.bodyMedium.copyWith(
              height: 1.6,
              color: AppColors.darkText,
            ),
          ),

          // Placeholder for image
          if (item.imagePath == null) ...[
            const SizedBox(height: 16),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.warmBeige,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.gold.withOpacity(0.3),
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 40,
                      color: AppColors.mediumText.withOpacity(0.5),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Add your photo here',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.mediumText,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimelineLine(String year, bool isLast) {
    return Column(
      children: [
        // Year badge
        Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBurgundy.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            year,
            style: AppTextStyles.label.copyWith(
              color: AppColors.whiteText,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Connecting line
        if (!isLast)
          Container(
            width: 2,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryBurgundy,
                  AppColors.gold.withOpacity(0.5),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

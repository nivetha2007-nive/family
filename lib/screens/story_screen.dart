import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../constants/animation_config.dart';
import '../models/timeline_item.dart';
import '../widgets/memory_app_wrapper.dart';

/// Their Story Timeline Screen - Redesigned for Mobile
/// Features: Responsive wide cards, proper text wrapping, center timeline
class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;

  // Timeline data - user will customize with actual dates
  final List<TimelineItem> _timelineItems = [
    TimelineItem(
      title: 'Before They Became Us',
      year: '2004',
      description:
          'Every beautiful story has a beginning...\n\nTheir paths would soon cross, and everything would change.',
      imagePath: 'assets/images/timeline/timeline_before_marriage.jpg',
    ),
    TimelineItem(
      title: 'The Day They Said I Do',
      year: '2006',
      description:
          '03 • 09 • 2006\nPariya Kovil, Cuddalore\n\nThe day two hearts became one, surrounded by love, blessings, and the promise of forever.',
      imagePath: 'assets/images/timeline/timeline_wedding.jpg',
    ),
    TimelineItem(
      title: 'Building Their Life Together',
      year: '2006-2010',
      description:
          'The early years of marriage. Learning, growing, and creating their first memories as husband and wife. Every day was a new adventure.',
      imagePath: 'assets/images/timeline/timeline_early_years.jpg',
    ),
    TimelineItem(
      title: 'Growing Family',
      year: '2010s',
      description:
          'New chapters began. The joy of parenthood, the blessing of family, and the love that multiplies with every milestone.',
      imagePath: 'assets/images/timeline/timeline_family.jpg',
    ),
    TimelineItem(
      title: 'Cherished Moments',
      year: '2010-2020',
      description:
          'Vacations, celebrations, quiet evenings, and Sunday mornings. The moments that make a lifetime, the memories that make a family.',
      imagePath: 'assets/images/timeline/timeline_moments.jpg',
    ),
    TimelineItem(
      title: 'Together Through Everything',
      year: '2020-2026',
      description:
          'Through challenges and triumphs, through change and growth, their love remained constant. Stronger together.',
      imagePath: 'assets/images/timeline/timeline_together.jpg',
    ),
    TimelineItem(
      title: 'Today - 20 Years of Love',
      year: '2026',
      description:
          'Twenty years of partnership, laughter, devotion, and unwavering commitment. A journey that continues, a love that endures.',
      imagePath: 'assets/images/timeline/timeline_today.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
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
                // Custom App Bar with Back Button
                SliverAppBar(
                  expandedHeight: 140,
                  floating: false,
                  pinned: true,
                  backgroundColor: AppColors.primaryBurgundy,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.whiteText,
                      size: 22,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      'Their Story',
                      style: AppTypography.appBarTitle.copyWith(
                        color: AppColors.whiteText,
                        fontSize: 22,
                      ),
                    ),
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primaryBurgundy,
                            AppColors.deepRed,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            size: 40,
                            color: AppColors.whiteText.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Timeline Content
                SliverPadding(
                  padding: const EdgeInsets.only(top: 24, bottom: 100),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return _buildTimelineItem(
                          context,
                          _timelineItems[index],
                          index,
                          index == _timelineItems.length - 1,
                        );
                      },
                      childCount: _timelineItems.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    TimelineItem item,
    int index,
    bool isLast,
  ) {
    return FadeTransition(
      opacity: _controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left spacer
            const SizedBox(width: 24),
            
            // Center timeline with year badge
            _buildTimelineLine(item.year, isLast),
            
            const SizedBox(width: 20),
            
            // Wide timeline card (takes most of the width)
            Expanded(
              child: _buildTimelineCard(context, item),
            ),
            
            // Right margin
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineLine(String year, bool isLast) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          // Year badge
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.primaryBurgundy,
                  AppColors.deepRed,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryBurgundy.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              year,
              style: AppTypography.timelineYear,
              textAlign: TextAlign.center,
            ),
          ),

          // Connecting line (if not last item)
          if (!isLast)
            Container(
              width: 3,
              height: 120,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryBurgundy,
                    AppColors.gold.withOpacity(0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTimelineCard(BuildContext context, TimelineItem item) {
    // Get screen width for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Card uses available width (about 80-85% of screen after margins)
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 180,
        maxWidth: screenWidth * 0.85, // Max 85% of screen width
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.gold.withOpacity(0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.softShadow,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            item.title,
            style: AppTypography.timelineTitle,
            // Proper text wrapping - will not break letter-by-letter
            softWrap: true,
            overflow: TextOverflow.visible,
          ),

          const SizedBox(height: 12),

          // Decorative divider
          Container(
            height: 2,
            width: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.gold,
                  AppColors.primaryBurgundy,
                ],
              ),
              borderRadius: BorderRadius.circular(1),
            ),
          ),

          const SizedBox(height: 16),

          // Description with proper line height and wrapping
          Text(
            item.description,
            style: AppTypography.timelineDescription,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),

          const SizedBox(height: 20),

          // Photo or placeholder
          if (item.imagePath != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.imagePath!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            )
          else if (item.isPlaceholder)
            _buildPhotoPlaceholder(item.placeholderText)
          else
            _buildGenericPhotoPlaceholder(),
        ],
      ),
    );
  }

  Widget _buildPhotoPlaceholder(String text) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.warmBeige,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.gold.withOpacity(0.4),
          width: 2,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 36,
              color: AppColors.gold.withOpacity(0.7),
            ),
            const SizedBox(height: 12),
            Text(
              text,
              style: AppTypography.comingSoon.copyWith(
                color: AppColors.mediumText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenericPhotoPlaceholder() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.lightCream,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.gold.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate_outlined,
              size: 32,
              color: AppColors.mediumText.withOpacity(0.6),
            ),
            const SizedBox(height: 10),
            Text(
              'Add your photo here',
              style: AppTypography.caption.copyWith(
                color: AppColors.mediumText.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

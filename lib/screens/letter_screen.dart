import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../constants/app_constants.dart';
import '../constants/animation_config.dart';
import '../widgets/decorative_divider.dart';
import '../widgets/memory_app_wrapper.dart';
import '../widgets/anniversary_app_bar.dart';

/// Personal letter screen - A heartfelt letter to parents
/// This screen is designed to feel like opening a handwritten letter
class LetterScreen extends StatefulWidget {
  const LetterScreen({super.key});

  @override
  State<LetterScreen> createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  final ScrollController _scrollController = ScrollController();

  // Placeholder letter content - User will replace with actual personal letter
  final String _letterContent = '''Dear Mom and Dad,

As I write this letter on your 20th wedding anniversary, my heart is filled with gratitude, love, and admiration for everything you both represent.

Twenty years ago, you promised to love, honor, and cherish each other. Today, I can say without hesitation that you have kept that promise every single day.

[REPLACE THIS WITH YOUR ACTUAL LETTER]

You've taught me what real love looks like – not the fairy tale kind, but the kind that shows up every day. The kind that chooses patience over frustration, understanding over judgment, and forgiveness over grudges.

Mom, your strength, grace, and unconditional love have been my guiding light. You've shown me what it means to be caring, resilient, and compassionate.

Dad, your wisdom, dedication, and unwavering support have been my foundation. You've taught me the value of hard work, integrity, and kindness.

Together, you've created a home filled with love, laughter, and warmth. You've built a partnership that inspires everyone around you.

Thank you for showing me what a beautiful marriage looks like. Thank you for being the best parents anyone could ask for. Thank you for every sacrifice, every hug, every word of encouragement, and every moment of your time.

As you celebrate 20 wonderful years together, I want you to know how proud I am to be your child. Your love story is one for the ages, and I feel blessed to have a front-row seat to witness it.

Here's to the love that built our family, the partnership that sustains it, and the joy that fills our home.

Happy 20th Anniversary, Mom and Dad.

I love you both more than words can express.

Forever grateful,
${AppConstants.child1Name} & ${AppConstants.child2Name}

---

[IMPORTANT: Replace the above text with your actual personal letter. Keep the emotional tone and structure, but make it authentically yours. Share specific memories, inside jokes, and personal moments that only your family would understand.]
''';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
    ));

    _controller.forward();
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
      intensity: AnimationIntensity.minimal,
      quotePosition: QuotePosition.topCenter,
      showQuotes: false, // Disable quotes on letter screen for readability
      child: Scaffold(
        backgroundColor: AppColors.creamBackground,
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // App bar with back button
              AnniversaryAppBar(
                title: 'A Letter of Love',
                subtitle: 'From the Heart',
                icon: Icons.mail_outline,
              ),

              // Letter content
              SliverToBoxAdapter(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),

                          // Letter envelope decoration
                          _buildLetterEnvelope(),

                          const SizedBox(height: 32),

                          // Main letter card
                          _buildLetterCard(),

                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLetterEnvelope() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.lightCream,
            AppColors.warmBeige,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.softShadow,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.favorite,
            size: 32,
            color: AppColors.deepRed,
          ),
          const SizedBox(height: 12),
          Text(
            'To Our Beloved Parents',
            style: AppTypography.timelineTitle.copyWith(
              color: AppColors.primaryBurgundy,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'On Your 20th Wedding Anniversary',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.mediumText,
            ),
          ),
          const SizedBox(height: 16),
          const DecorativeDivider(
            width: 150,
            color: AppColors.gold,
          ),
        ],
      ),
    );
  }

  Widget _buildLetterCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.gold.withOpacity(0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.softShadow,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Decorative top corner
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.gold.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.auto_stories,
                  size: 20,
                  color: AppColors.gold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.deepRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 12,
                      color: AppColors.deepRed,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'With Love',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.deepRed,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Letter content
          SelectableText(
            _letterContent,
            style: AppTypography.letterBody,
          ),

          const SizedBox(height: 32),

          // Signature line
          const Center(
            child: DecorativeDivider(
              width: 120,
              color: AppColors.gold,
            ),
          ),

          const SizedBox(height: 24),

          // Hearts decoration
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.favorite,
                    size: 16,
                    color: AppColors.deepRed.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

  // Personal letter in Tamil - A heartfelt message to Amma & Daddy
  final String _letterContent = '''உங்களுடைய 20வது திருமண நாளில் இந்தக் கடிதத்தை எழுதும் போது, என் மனம் நன்றியுணர்வு, அன்பு மற்றும் பெருமையால் நிரம்பியுள்ளது.

இருபது ஆண்டுகளுக்கு முன்பு, நீங்கள் ஒருவரை ஒருவர் நேசிக்கவும், மதிக்கவும், வாழ்நாள் முழுவதும் துணையாக இருக்கவும் உறுதியளித்தீர்கள். இன்று, எந்தத் தயக்கமும் இல்லாமல் அந்த வாக்குறுதியை நீங்கள் ஒவ்வொரு நாளும் காப்பாற்றி வந்திருக்கிறீர்கள் என்று நான் பெருமையுடன் சொல்ல முடிகிறது.

உண்மையான அன்பு எப்படி இருக்கும் என்பதை நீங்கள் எனக்குக் கற்றுக் கொடுத்தீர்கள். அது கதைகளில் வரும் கற்பனையான அன்பு அல்ல; ஒவ்வொரு நாளும் செயல்களில் வெளிப்படும் அன்பு. கோபத்திற்கு பதிலாக பொறுமையைத் தேர்ந்தெடுக்கும் அன்பு, குறை கூறுவதற்கு பதிலாக புரிதலைக் காட்டும் அன்பு, மனக்கசப்பிற்கு பதிலாக மன்னிப்பை வழங்கும் அன்பு.

Amma...🩷, உங்கள் வலிமை, கண்ணியம் மற்றும் நிபந்தனையற்ற அன்பு என் வாழ்க்கையின் வழிகாட்டும் ஒளியாக இருந்துள்ளது. அக்கறை, மன உறுதி மற்றும் கருணையுடன் வாழ்வதன் அர்த்தத்தை நீங்கள் எனக்குக் கற்றுக் கொடுத்தீர்கள்.

Daddy...🫂, உங்கள் அறிவு, அர்ப்பணிப்பு மற்றும் மாறாத ஆதரவு என் வாழ்க்கையின் உறுதியான அடித்தளமாக இருந்துள்ளது. கடின உழைப்பு, நேர்மை மற்றும் இரக்கத்தின் மதிப்பை நீங்கள் எனக்குக் கற்றுக் கொடுத்தீர்கள்.

நீங்கள் இருவரும் சேர்ந்து அன்பு, சிரிப்பு மற்றும் மகிழ்ச்சி நிறைந்த ஒரு இல்லத்தை உருவாக்கியுள்ளீர்கள். உங்களின் வாழ்க்கைத் துணை உறவு உங்களைச் சுற்றியுள்ள அனைவருக்கும் ஒரு முன்மாதிரியாக இருக்கிறது.

இன்றும் எனக்கு அந்த வார்த்தை நினைவில் இருக்கிறது..."உன்னால முடிஞ்சத பண்ணு அம்மு, மத்ததை பார்த்துக்கலாம்... நான் இருக்கேன்."

ஒரு அழகான திருமண வாழ்க்கை எப்படி இருக்க வேண்டும் என்பதை எனக்குக் காட்டியதற்கு நன்றி. யாருக்கும் கிடைக்கக்கூடிய சிறந்த பெற்றோர்களாக இருந்ததற்கு நன்றி. நீங்கள் செய்த ஒவ்வொரு தியாகத்திற்கும், ஒவ்வொரு அரவணைப்பிற்கும், ஒவ்வொரு ஊக்கமூட்டும் வார்த்தைக்கும், எனக்காக செலவிட்ட ஒவ்வொரு நிமிடத்திற்கும் என் மனமார்ந்த நன்றி.

நீங்கள் இருவரும் இணைந்து வாழ்ந்த இந்த 20 அற்புதமான ஆண்டுகளை கொண்டாடும் இந்த தருணத்தில், உங்கள் மகளாக இருப்பதில் நான் எவ்வளவு பெருமைப்படுகிறேன் என்பதை நீங்கள் அறிந்திருக்க வேண்டும். உங்கள் காதல் கதை காலம் கடந்தும் பேசப்படும் ஒரு அழகான காவியம். அதை அருகிலிருந்து காணும் வாய்ப்பு எனக்குக் கிடைத்திருப்பது என் வாழ்க்கையின் மிகப் பெரிய பாக்கியம்.

எங்கள் குடும்பத்தை உருவாக்கிய அந்த அன்பிற்கும், அதை நிலைநிறுத்தும் உங்கள் இணைப்பிற்கும், எங்கள் இல்லத்தை மகிழ்ச்சியால் நிரப்பும் உங்கள் பாசத்திற்கும் என் மனமார்ந்த வாழ்த்துகள்.

அம்மாவிற்கும் அப்பாவிற்கும் இனிய 20வது திருமண நாள் நல்வாழ்த்துக்கள்!

வார்த்தைகளால் சொல்ல முடியாத அளவிற்கு நான் உங்களை இருவரையும் நேசிக்கிறேன்.

அன்புடன்,

உங்கள் மகள் ❤️
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
                title: 'என் மனதின் குரல்',
                subtitle: 'A Letter of Love',
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
            'என் அன்பு அம்மா & அப்பாவிற்கு',
            style: AppTypography.timelineTitle.copyWith(
              color: AppColors.primaryBurgundy,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'உங்கள் 20வது திருமண நாளில்',
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'home_screen.dart';

/// Cinematic Canva Video Introduction
/// Full-screen 1-minute Canva invitation video
/// Auto-navigates to home page when complete
/// NO overlays, NO floating hearts, just pure Canva design
class VideoInvitationScreen extends StatefulWidget {
  const VideoInvitationScreen({super.key});

  @override
  State<VideoInvitationScreen> createState() => _VideoInvitationScreenState();
}

class _VideoInvitationScreenState extends State<VideoInvitationScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;
  bool _hasNavigated = false; // Prevent multiple navigations
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset(
        'assets/videos/anniversary_invitation.mp4',
      );

      await _controller.initialize();
      
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
        
        // Auto-play the Canva invitation
        await _controller.play();
        
        // Listen for video completion
        _controller.addListener(_videoListener);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = 'Our story is taking a moment to load...\n\n'
              'Please ensure the video is at:\n'
              'assets/videos/anniversary_invitation.mp4';
        });
      }
    }
  }

  void _videoListener() {
    // Check if video has reached the end
    if (_controller.value.position >= _controller.value.duration) {
      if (mounted && !_hasNavigated) {
        _hasNavigated = true;
        _navigateToHome();
      }
    }
  }

  Future<void> _navigateToHome() async {
    // Small delay for smooth transition
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (!mounted) return;
    
    // Dispose video first
    _controller.removeListener(_videoListener);
    await _controller.pause();
    
    // Elegant fade transition to home page
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
              ),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    );
  }

  void _goBack() {
    if (!_hasNavigated) {
      _hasNavigated = true;
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _goBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Video player (full-screen, aspect ratio preserved)
            if (_isInitialized)
              Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              ),

            // Elegant loading state
            if (!_isInitialized && !_hasError)
              Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated heart
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.8, end: 1.0),
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: Icon(
                              Icons.favorite,
                              size: 60,
                              color: AppColors.deepRed.withOpacity(value),
                            ),
                          );
                        },
                        onEnd: () {
                          // Loop animation
                          if (mounted && !_isInitialized) {
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'A little surprise is waiting...',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.whiteText.withOpacity(0.9),
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

            // Error state with retry
            if (_hasError)
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 80,
                        color: AppColors.deepRed.withOpacity(0.8),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Our story is taking a moment...',
                        style: AppTypography.sectionTitle.copyWith(
                          color: AppColors.whiteText,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _errorMessage,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.whiteText.withOpacity(0.8),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasError = false;
                                _isInitialized = false;
                              });
                              _initializeVideo();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.deepRed,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Try Again',
                              style: AppTypography.button.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            onPressed: _goBack,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.gold,
                              side: BorderSide(color: AppColors.gold, width: 2),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Go Back',
                              style: AppTypography.button.copyWith(
                                color: AppColors.gold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            // Subtle back button (top-left)
            if (_isInitialized)
              SafeArea(
                child: Positioned(
                  top: 20,
                  left: 20,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _goBack,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white.withOpacity(0.8),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
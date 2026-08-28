import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Full-screen video invitation screen
/// Plays the Canva-created MP4 invitation video
/// NO floating hearts, NO recreation - just the pure Canva design
class VideoInvitationScreen extends StatefulWidget {
  const VideoInvitationScreen({super.key});

  @override
  State<VideoInvitationScreen> createState() => _VideoInvitationScreenState();
}

class _VideoInvitationScreenState extends State<VideoInvitationScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;
  bool _showContinueButton = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    
    // Set landscape mode for better viewing
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
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
        
        // Auto-play the invitation
        _controller.play();
        
        // Listen for video completion
        _controller.addListener(() {
          if (_controller.value.position >= _controller.value.duration) {
            if (mounted && !_showContinueButton) {
              setState(() {
                _showContinueButton = true;
              });
            }
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = 'Could not load invitation video.\n\n'
              'Please add your Canva video as:\n'
              'assets/videos/anniversary_invitation.mp4';
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    // Reset orientation preferences
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  void _navigateToStory() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video player (centered with aspect ratio preserved)
          if (_isInitialized)
            Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),

          // Loading indicator
          if (!_isInitialized && !_hasError)
            Container(
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.gold,
                      strokeWidth: 3,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Loading your invitation...',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.whiteText,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Error message
          if (_hasError)
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.video_library_outlined,
                      size: 64,
                      color: AppColors.gold.withOpacity(0.7),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      _errorMessage,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.whiteText,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _navigateToStory,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        foregroundColor: Colors.black,
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Back button (top-left)
          SafeArea(
            child: Positioned(
              top: 16,
              left: 16,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _navigateToStory,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.gold.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.gold,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Continue button (appears after video finishes)
          if (_showContinueButton && _isInitialized)
            SafeArea(
              child: Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: AnimatedOpacity(
                    opacity: _showContinueButton ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gold.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: _navigateToStory,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gold,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Continue Their Story',
                              style: AppTypography.button.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.black,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
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

# Global Animation & Emotional Atmosphere System

## Overview

Your anniversary app now has a beautiful, consistent animated atmosphere throughout with floating hearts, particles, and timed love quotes.

## 🎨 System Components

### 1. AnimatedMemoryBackground
The main reusable background widget that provides floating hearts and particles.

### 2. Love Quote System
Automatically displays romantic quotes every 2 minutes throughout the app.

### 3. Screen-Specific Intensities
Different screens have different animation intensities:

- **Enhanced** (1.0) - Welcome, Celebration screens - magical and prominent
- **Normal** (0.8) - Invitation, Final Message, Home - standard emotional
- **Moderate** (0.6) - Navigation screens
- **Subtle** (0.4) - Story, Photos, Videos - visible but not distracting
- **Minimal** (0.2) - Letter screen - extremely subtle for readability

## 📝 How to Use

### Wrapping a Screen

```dart
import '../widgets/memory_app_wrapper.dart';
import '../constants/animation_config.dart';

// Wrap your screen content
return MemoryAppWrapper(
  intensity: AnimationIntensity.normal,
  quotePosition: QuotePosition.topCenter,
  showQuotes: true,
  child: Scaffold(
    // Your screen content
  ),
);
```

### Animation Intensities

```dart
AnimationIntensity.minimal    // Very subtle - letter, video player
AnimationIntensity.subtle     // Gentle - photo gallery, story
AnimationIntensity.moderate   // Balanced - most screens
AnimationIntensity.normal     // Standard - home, navigation
AnimationIntensity.enhanced   // Magical - celebration, special moments
```

### Quote Positions

```dart
QuotePosition.topCenter      // Top of screen
QuotePosition.center         // Middle of screen
QuotePosition.bottomCenter   // Bottom of screen
```

### Disable Quotes

```dart
MemoryAppWrapper(
  showQuotes: false,  // Disable quotes for specific screens
  child: YourContent(),
)
```

## ⚙️ Configuration

All animation settings are centralized in `lib/constants/animation_config.dart`.

### Adjustable Settings:

```dart
// Heart counts and sizes
static const int heartCount = 20;
static const double minHeartSize = 12.0;
static const double maxHeartSize = 28.0;

// Particle settings
static const int particleCount = 15;

// Quote timing
static const Duration quoteCycleDuration = Duration(minutes: 2);
static const Duration quoteDisplayDuration = Duration(seconds: 5);

// Colors
static const Color heartColor = AppColors.deepRed;
static const Color particleColor = AppColors.gold;
```

## 💬 Managing Quotes

### Add Your Own Quotes

Edit `lib/constants/quotes.dart`:

```dart
// Personal quotes section
static const List<String> personalQuotes = [
  "Your personal quote here",
  "Another meaningful quote",
  "Mom and Dad, you inspire us",
];
```

### Quote Categories

- `anniversaryQuotes` - Time and anniversary related
- `familyQuotes` - Family and togetherness
- `loveQuotes` - Love and commitment
- `memoryQuotes` - Memories and journey
- `personalQuotes` - Your own custom quotes

### Manually Trigger a Quote

```dart
import '../widgets/quote_manager.dart';

// Trigger a quote immediately (for testing or special moments)
QuoteManager().triggerQuote();
```

## 🎯 Current Screen Setup

| Screen | Intensity | Quote Position | Quotes Enabled |
|--------|-----------|----------------|----------------|
| Welcome | Enhanced | Center | Yes |
| Invitation | Normal | Bottom | Yes |
| Story Timeline | Subtle | Top | Yes |
| Photo Gallery | Subtle | Top | Yes |
| Video Memories | Subtle | Top | Yes |
| Letter | Minimal | Top | No |
| Celebration | Enhanced | Bottom | Yes |
| Final Message | Normal | Center | Yes |

## 🎨 Heart Styles

The system automatically uses three different heart styles:
- **Filled hearts** (❤️)
- **Outline hearts** (♡)
- **Glowing hearts** (❤️ with glow effect)

## 🔧 Performance

The system is optimized for mobile devices:

- Animations pause when app is in background
- Limited number of active animations (max 35)
- Efficient animation controllers
- Proper disposal of resources
- Smooth scrolling maintained

## 🎬 Animation Behavior

### Hearts
- Float slowly upward
- Drift left and right (sine wave motion)
- Subtle rotation
- Fade in at bottom
- Fade out at top
- Continuous loop with random delays

### Particles
- Small glowing dots
- Similar floating behavior
- More subtle than hearts
- Golden color
- Soft glow effect

### Quotes
- Appear every 2 minutes
- Fade in with scale animation
- Display for 5 seconds
- Fade out gracefully
- Never repeats same quote twice in a row
- Elegant glass-morphism card design

## 🎨 Customization Tips

### Change Overall Animation Speed

In `animation_config.dart`:
```dart
static const Duration minHeartDuration = Duration(seconds: 8);
static const Duration maxHeartDuration = Duration(seconds: 15);
```

### Change Heart/Particle Counts

```dart
static const int heartCount = 20;  // Increase for more hearts
static const int particleCount = 15;  // Increase for more particles
```

### Change Colors

```dart
static const Color heartColor = AppColors.deepRed;
static const Color particleColor = AppColors.gold;
static const Color quoteBackgroundColor = AppColors.lightCream;
```

### Adjust Opacity

```dart
static const double minHeartOpacity = 0.1;
static const double maxHeartOpacity = 0.4;
```

## 🚀 Testing the System

### Test Quotes Immediately

```dart
// Add this temporarily to trigger quotes faster
static const Duration quoteCycleDuration = Duration(seconds: 10);
```

### Test Different Intensities

Change the intensity on any screen to see the effect:
```dart
MemoryAppWrapper(
  intensity: AnimationIntensity.enhanced,  // Try different values
  child: YourContent(),
)
```

## 📱 Best Practices

1. **Letter Screen** - Always use `minimal` intensity and disable quotes
2. **Video Player** - Use `minimal` intensity when video is playing
3. **Photo Viewer** - Reduce intensity during full-screen viewing
4. **Important Content** - Lower intensity for text-heavy screens
5. **Celebration** - Use `enhanced` for special moments

## 🎁 The Result

Your app now feels like a **living digital memory book** with:
- Continuous emotional atmosphere
- Floating memories (hearts and particles)
- Inspiring quotes appearing naturally
- Consistent visual language
- Professional polish
- Emotional depth

The animation supports the content rather than overwhelming it, creating a magical experience that honors your parents' 20-year journey together! ❤️

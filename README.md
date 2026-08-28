# 20 Years of Love - Anniversary Gift App

A beautiful, emotional Flutter mobile app created as a personal anniversary gift for your parents' 20th wedding anniversary.

## 📱 About This App

This is a premium, personalized mobile application designed to celebrate your parents' 20 years of marriage through:

- 📖 Their love story and journey
- 📸 Photo memories organized by categories
- 🎥 Video memories with custom player
- 💌 A personal letter from you to them
- 🎉 20th anniversary celebration screen
- ❤️ Final heartfelt message

## 🎨 Design Features

- **Elegant Color Scheme**: Burgundy, cream, and gold palette inspired by traditional wedding aesthetics
- **Premium Typography**: Serif fonts for headings, clean sans-serif for body text
- **Smooth Animations**: Fade, slide, scale, and hero transitions throughout
- **Emotional UI**: Designed to feel like a digital scrapbook and personal gift
- **Responsive Layouts**: Adapts to different mobile screen sizes

## 📂 Project Structure

```
anniversary_gift/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── constants/
│   │   └── app_constants.dart       # App-wide constants
│   ├── models/
│   │   ├── photo_memory.dart        # Photo data model
│   │   ├── video_memory.dart        # Video data model
│   │   └── timeline_item.dart       # Timeline/story data model
│   ├── screens/
│   │   ├── welcome_screen.dart      # Opening screen
│   │   ├── invitation_screen.dart   # Wedding invitation style screen
│   │   ├── home_screen.dart         # Main navigation hub
│   │   ├── story_screen.dart        # Their story timeline
│   │   ├── photo_gallery_screen.dart # Photo memories with categories
│   │   ├── photo_viewer_screen.dart  # Full-screen photo viewer
│   │   ├── video_memories_screen.dart # Video list
│   │   ├── video_player_screen.dart  # Video player
│   │   ├── letter_screen.dart       # Personal letter
│   │   ├── celebration_screen.dart  # 20th anniversary celebration
│   │   └── final_message_screen.dart # Final message
│   ├── theme/
│   │   ├── app_colors.dart          # Color palette
│   │   ├── app_text_styles.dart     # Typography system
│   │   └── app_theme.dart           # Theme configuration
│   └── widgets/
│       ├── decorative_divider.dart  # Decorative UI elements
│       └── floating_hearts.dart     # Animated hearts
└── assets/
    ├── images/                      # Your photos go here
    ├── videos/                      # Your videos go here
    ├── backgrounds/                 # Background images
    └── icons/                       # Custom icons
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.12.2 or higher)
- Android Studio or VS Code
- Android device or emulator

### Installation

1. **Clone or download this project**

2. **Install dependencies**
   ```bash
   cd anniversary_gift
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## ✏️ Customizing Your App

### 1. Update Parents' Information

Edit `lib/constants/app_constants.dart`:

```dart
static const String groomName = 'Your Dad\'s Name';
static const String brideName = 'Your Mom\'s Name';
static const String weddingDate = 'DD • MM • YYYY';
static const String weddingVenue = 'Wedding Venue';
static const String child1Name = 'Your Name';
static const String child2Name = 'Sibling Name'; // or remove if single child
```

### 2. Add Your Photos

1. Navigate to `assets/images/`
2. Add your photos with these naming conventions:
   - Wedding: `wedding_1.jpg`, `wedding_2.jpg`, etc.
   - Family: `family_1.jpg`, `family_2.jpg`, etc.
   - Vacations: `vacation_1.jpg`, etc.
   - Celebrations: `celebration_1.jpg`, etc.
   - Everyday: `everyday_1.jpg`, etc.
   - Special: `special_1.jpg`, etc.
   - 20 Years: `twenty_years_1.jpg`, etc.

3. Update photo counts in `lib/screens/photo_gallery_screen.dart` to match your actual number of photos

### 3. Add Your Videos

1. Navigate to `assets/videos/`
2. Add your video files (MP4 format recommended)
3. Create thumbnails in `assets/videos/thumbnails/`
4. Update video list in `lib/screens/video_memories_screen.dart`

**Note**: For actual video playback, add the `video_player` package to `pubspec.yaml`

### 4. Write Your Personal Letter

Edit `lib/screens/letter_screen.dart`:

Replace the `_letterContent` string with your actual heartfelt letter to your parents.

### 5. Update Story Timeline

Edit `lib/screens/story_screen.dart`:

Replace the placeholder timeline items with your parents' actual story, dates, and memories.

### 6. Customize Final Message

Edit `lib/screens/final_message_screen.dart`:

Replace the `_finalMessage` with your personal closing words.

### 7. Adjust Colors (Optional)

Edit `lib/theme/app_colors.dart` to change the color scheme to your preference.

## 🎯 App Flow

1. **Welcome Screen** → "20 Years of Love"
2. **Invitation Screen** → Wedding details and children's dedication
3. **Home Screen** → Main navigation with 4 tabs:
   - Story (Timeline of their journey)
   - Photos (Categorized gallery)
   - Videos (Memory videos)
   - Letter (Your personal letter)
4. **Celebration Screen** → 20th anniversary celebration (via FAB)
5. **Final Message Screen** → Closing heartfelt words

## 📱 Building for Release

### Android APK

```bash
flutter build apk --release
```

The APK will be in: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (for Play Store)

```bash
flutter build appbundle --release
```

### iOS (requires Mac)

```bash
flutter build ios --release
```

## 🎨 Customization Tips

### Fonts

To use custom fonts:

1. Add font files to `assets/fonts/`
2. Update `pubspec.yaml`:
   ```yaml
   fonts:
     - family: YourFontName
       fonts:
         - asset: assets/fonts/YourFont-Regular.ttf
         - asset: assets/fonts/YourFont-Bold.ttf
           weight: 700
   ```
3. Update `lib/theme/app_text_styles.dart` to use your font

### Background Images

Add custom background images to `assets/backgrounds/` and use them in screens.

### Adding More Content

- Add more timeline items in `story_screen.dart`
- Add more photo categories in `photo_memory.dart`
- Add more videos in `video_memories_screen.dart`

## 🔧 Troubleshooting

### Images not showing
- Ensure image paths in code match actual file names
- Run `flutter clean` and `flutter pub get`
- Check that assets are declared in `pubspec.yaml`

### App crashes
- Check console for error messages
- Ensure all required files are present
- Verify all import statements are correct

### Performance issues
- Compress large images (keep under 5MB each)
- Optimize videos (keep under 50MB each)
- Use appropriate image resolutions

## 💡 Ideas for Enhancement

- Add background music
- Include audio messages
- Add more interactive elements
- Create a slideshow feature
- Add sharing functionality
- Include a guest book for messages

## 📝 Important Notes

- This is a **personal gift app**, not intended for commercial use
- Keep all personal information and photos private
- Test thoroughly on your target device before presenting
- Make sure to replace ALL placeholder content with your actual content
- Back up your photos and videos before adding them to the project

## ❤️ Final Thoughts

This app is designed to be a heartfelt, emotional gift for your parents' 20th anniversary. Take your time customizing each section, adding personal touches, meaningful photos, and sincere words.

The most important part is not the code or design—it's the love, thought, and effort you put into personalizing this gift for them.

**Happy Anniversary to your parents! 🎉❤️**

---

**Made with ❤️ for Mom & Dad's 20th Anniversary**

## 📄 License

This is a personal project. Feel free to use and modify as needed for your own personal gifts.

# Customization Guide - Step by Step

This guide will walk you through personalizing the anniversary app for your parents.

## ✅ Step 1: Update Parents' Information

Open `lib/constants/app_constants.dart` and update:

```dart
static const String groomName = 'Your Dad\'s Name';  // Change this
static const String brideName = 'Your Mom\'s Name';  // Change this
static const String weddingDate = 'DD • MM • YYYY'; // Change this
static const String weddingVenue = 'Venue Name, City'; // Change this
static const String child1Name = 'Your Name';        // Change this
static const String child2Name = 'Sibling Name';     // Change this or remove
```

## ✅ Step 2: Write Your Personal Letter

Open `lib/screens/letter_screen.dart` and find the `_letterContent` variable (around line 30).

Replace the entire placeholder letter with your actual heartfelt message to your parents.

**Tips:**
- Be genuine and personal
- Share specific memories
- Express gratitude
- Keep the emotional tone
- You can make it as long or short as you want

## ✅ Step 3: Update Their Story Timeline

Open `lib/screens/story_screen.dart` and find the `_timelineItems` list (around line 30).

Replace each timeline item with your parents' actual story:

```dart
TimelineItem(
  title: 'Your Title',
  year: 'Year or Year Range',
  description: 'Your actual description of this period...',
  imagePath: 'assets/images/your_photo.jpg', // Optional
),
```

**Important:** Add, remove, or modify timeline items as needed to tell their unique story.

## ✅ Step 4: Update Final Message

Open `lib/screens/final_message_screen.dart` and find the `_finalMessage` variable (around line 30).

Replace it with your actual closing message.

## ✅ Step 5: Add Your Photos

1. Navigate to `assets/images/` folder
2. Add your photos with these naming conventions:

### Photo Organization:

- **Wedding**: `wedding_1.jpg`, `wedding_2.jpg`, ... `wedding_N.jpg`
- **Family**: `family_1.jpg`, `family_2.jpg`, ... `family_N.jpg`
- **Vacations**: `vacation_1.jpg`, `vacation_2.jpg`, ... `vacation_N.jpg`
- **Celebrations**: `celebration_1.jpg`, `celebration_2.jpg`, ... `celebration_N.jpg`
- **Everyday**: `everyday_1.jpg`, `everyday_2.jpg`, ... `everyday_N.jpg`
- **Special**: `special_1.jpg`, `special_2.jpg`, ... `special_N.jpg`
- **20 Years**: `twenty_years_1.jpg`, `twenty_years_2.jpg`, ... `twenty_years_N.jpg`

### Update Photo Counts:

Open `lib/screens/photo_gallery_screen.dart` and update the `List.generate` numbers for each category (around line 35-70):

```dart
PhotoCategory.wedding: List.generate(
  6,  // Change this to your actual number of wedding photos
  (index) => PhotoMemory(...),
),
```

Do this for each category: wedding, family, vacations, celebrations, everyday, special, twentyYears.

### Add Captions (Optional):

You can customize captions for each photo in the same file by editing the `caption` and `date` fields.

## ✅ Step 6: Add Your Videos (Optional)

1. Navigate to `assets/videos/` folder
2. Add your video files (.mp4 format recommended)
3. Create thumbnails in `assets/videos/thumbnails/`

### Update Video List:

Open `lib/screens/video_memories_screen.dart` and find the `_videos` list (around line 25).

Replace with your actual videos:

```dart
VideoMemory(
  videoPath: 'assets/videos/your_video.mp4',
  thumbnailPath: 'assets/videos/thumbnails/your_video.jpg',
  title: 'Your Video Title',
  description: 'Video description',
  date: 'Date',
  duration: 'MM:SS',
),
```

## ✅ Step 7: Add Best Anniversary Photo

In `lib/screens/celebration_screen.dart`, find the placeholder around line 320 and replace it with your best anniversary photo:

```dart
// Instead of the placeholder Container, add:
Image.asset(
  'assets/images/best_anniversary_photo.jpg',
  fit: BoxFit.cover,
)
```

Make sure to add this image file to `assets/images/`.

## ✅ Step 8: Test the App

Run the app to test:

```bash
flutter run
```

### What to Test:

- [  ] Welcome screen appears correctly
- [  ] Parents' names and wedding details show correctly
- [  ] Your children's names appear correctly
- [  ] Story timeline shows your content
- [  ] Photos load in all categories
- [  ] Letter displays your message
- [  ] Videos appear (if added)
- [  ] Celebration screen works
- [  ] Final message shows
- [  ] Navigation works smoothly
- [  ] All animations are smooth

## ✅ Step 9: Build Release Version

### For Android:

```bash
flutter build apk --release
```

The APK will be at: `build/app/outputs/flutter-apk/app-release.apk`

Transfer this file to your Android device and install it.

## 🎨 Optional Customizations

### Change Colors:

Edit `lib/theme/app_colors.dart` to change the color scheme.

### Change Fonts:

1. Add font files to `assets/fonts/`
2. Update `pubspec.yaml` fonts section
3. Update `lib/theme/app_text_styles.dart`

### Add Background Images:

Add images to `assets/backgrounds/` and use them in screens.

### Modify Timeline Layout:

Edit `lib/screens/story_screen.dart` to change the timeline appearance.

## 🚨 Important Reminders

1. **Test on actual device** - Emulators may not show the true feel
2. **Keep backups** - Back up your photos and videos
3. **Check file sizes** - Large images/videos may slow the app
4. **Proofread everything** - Check spelling in your letter and messages
5. **Test all navigation** - Make sure every screen is reachable

## 💡 Quick Fixes

### Problem: Images not showing
**Solution:** Check file names match exactly (case-sensitive), ensure images are in correct folders, run `flutter clean` then `flutter pub get`

### Problem: App crashes
**Solution:** Check console for errors, ensure all required photos are present or remove references to missing photos

### Problem: Text overflow
**Solution:** Reduce text length or adjust font sizes in `app_text_styles.dart`

## 📝 Final Checklist

Before presenting to your parents:

- [  ] All personal information updated
- [  ] Letter written and proofread
- [  ] Story timeline complete
- [  ] Photos added and display correctly
- [  ] Videos added (if using)
- [  ] Final message written
- [  ] Tested on actual device
- [  ] All screens accessible
- [  ] Animations working smoothly
- [  ] No crashes or errors
- [  ] App feels personal and emotional

## 🎉 You're Done!

Your personalized anniversary app is ready to present to your parents!

This is more than just an app - it's a heartfelt gift that shows your love, appreciation, and effort. Your parents will treasure it! ❤️

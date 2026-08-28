# Videos Folder

## How to Add Your Videos

Replace the placeholder content with your actual anniversary videos.

### Video Organization:

1. **Wedding Videos**: `wedding_ceremony.mp4`, `wedding_reception.mp4`
2. **Family Videos**: `family_moments.mp4`
3. **Vacation Videos**: `vacation_memories.mp4`
4. **Celebration Videos**: `celebrations.mp4`
5. **Everyday Life**: `everyday_life.mp4`
6. **Anniversary Message**: `anniversary_message.mp4`

### Video Guidelines:

- **Format**: MP4 (H.264 codec) recommended
- **Resolution**: 1920x1080 (Full HD) or 1280x720 (HD)
- **Duration**: Keep videos under 10 minutes for optimal performance
- **File size**: Compress videos to under 50MB if possible

### Thumbnails:

Create a `thumbnails/` subfolder and add thumbnail images for each video:
- `thumbnails/wedding_ceremony.jpg`
- `thumbnails/wedding_reception.jpg`
- etc.

## Video Player Integration:

The app currently has placeholder video player functionality. To add actual video playback:

1. Add `video_player` package to `pubspec.yaml`:
   ```yaml
   dependencies:
     video_player: ^2.8.0
   ```

2. Update `video_player_screen.dart` to initialize and use the video player

3. Run `flutter pub get` to install the package

## Tips:

- Use video editing software to trim and enhance videos before adding
- Add background music or voiceovers for emotional impact
- Keep videos short and meaningful
- Test video playback on your target device

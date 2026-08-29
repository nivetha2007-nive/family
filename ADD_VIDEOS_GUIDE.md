# 📹 How to Add Your 10 Videos to the Anniversary App

## 📍 Where to Save Your Videos

### 1. **Opening Canva Video** (The 1-minute invitation)
**File Name:** `anniversary_invitation.mp4`  
**Location:** `assets/videos/anniversary_invitation.mp4`

This is your special Canva invitation video that plays when "Begin Our Story" is clicked.

---

### 2. **Family Memory Videos** (The 10 videos for Video Memories page)

Save these in: `assets/videos/memories/`

Use these exact names:

1. `video_01.mp4` - First family memory
2. `video_02.mp4` - Second family memory
3. `video_03.mp4` - Third family memory
4. `video_04.mp4` - Fourth family memory
5. `video_05.mp4` - Fifth family memory
6. `video_06.mp4` - Sixth family memory
7. `video_07.mp4` - Seventh family memory
8. `video_08.mp4` - Eighth family memory
9. `video_09.mp4` - Ninth family memory
10. `video_10.mp4` - Tenth family memory

---

## 📂 Complete Folder Structure

```
anniversary_gift/
└── assets/
    └── videos/
        ├── anniversary_invitation.mp4    ← Canva intro video
        └── memories/
            ├── video_01.mp4
            ├── video_02.mp4
            ├── video_03.mp4
            ├── video_04.mp4
            ├── video_05.mp4
            ├── video_06.mp4
            ├── video_07.mp4
            ├── video_08.mp4
            ├── video_09.mp4
            └── video_10.mp4
```

---

## 🎯 Step-by-Step Instructions

### Step 1: Create the Folders

1. Open File Explorer
2. Navigate to: `e:\MOM & DAD\anniversary_gift\assets\videos\`
3. Create a new folder called: `memories`

Your path should now be:
```
e:\MOM & DAD\anniversary_gift\assets\videos\memories\
```

---

### Step 2: Rename Your Videos

Rename your 10 family videos to:
- `video_01.mp4`
- `video_02.mp4`
- `video_03.mp4`
- `video_04.mp4`
- `video_05.mp4`
- `video_06.mp4`
- `video_07.mp4`
- `video_08.mp4`
- `video_09.mp4`
- `video_10.mp4`

**Important:** Use exactly these names (lowercase, with underscore and leading zero)

---

### Step 3: Copy Videos to Folder

1. **Canva invitation video:**
   - Copy to: `e:\MOM & DAD\anniversary_gift\assets\videos\anniversary_invitation.mp4`

2. **10 family memory videos:**
   - Copy all to: `e:\MOM & DAD\anniversary_gift\assets\videos\memories\`

---

### Step 4: Add Captions (Optional)

If you want custom captions for each video, I can help you edit the app to show:
- "Wedding Day"
- "First Anniversary"
- "Family Vacation"
- "Daughters' Birthday"
- etc.

Just tell me what caption you want for each video!

---

## 🎬 Video Requirements

### Format:
- **Type:** MP4 (recommended)
- **Codec:** H.264
- **Audio:** AAC

### Size:
- **Each video:** Under 50MB recommended
- **Total:** All 11 videos under 500MB

### Quality:
- **Resolution:** 720p or 1080p
- **Frame rate:** 30fps or 60fps

### Duration:
- **Canva intro:** ~1 minute (your choice)
- **Memory videos:** 30 seconds to 5 minutes each

---

## 🎨 What Each Video Does

### 1. **Canva Invitation Video**
- Plays when "Begin Our Story" is clicked
- Full-screen, cinematic
- Auto-navigates to home page when done

### 2. **Memory Videos (10 videos)**
- Show in "Video Memories" page
- Grid layout with thumbnails
- Tap to play full-screen
- Each video has a caption

---

## ✅ Checklist

Before running the app, make sure:

- [ ] Created `memories` folder inside `assets/videos/`
- [ ] Copied Canva video as `anniversary_invitation.mp4`
- [ ] Renamed 10 videos to `video_01.mp4` through `video_10.mp4`
- [ ] All videos copied to correct locations
- [ ] All videos are MP4 format
- [ ] Each video file size is reasonable (under 50MB)

---

## 🚀 After Adding Videos

Once you've added all videos:

1. Open PowerShell in the project folder
2. Run: `flutter pub get`
3. Run: `flutter run -d chrome`
4. Test all videos play correctly!

---

## 📱 How It Will Look

### Opening Screen:
- Beautiful home screen with floating hearts
- "Begin Our Story" button

### Click Button:
- **Canva invitation video** plays full-screen
- Animated heart while loading
- Auto-plays your 1-minute Canva video

### Video Finishes:
- Automatically opens home page

### Video Memories Page:
- Shows grid of 10 video thumbnails
- Each with play button
- Tap any video to watch full-screen

---

## 💡 Pro Tips

### Compressing Videos:
If videos are too large, use:
- **Online:** cloudconvert.com
- **Software:** HandBrake (free)
- **Target:** 720p, H.264, 3-5 Mbps

### Ordering Videos:
Number them in the order you want them displayed:
- `video_01.mp4` = First video shown
- `video_02.mp4` = Second video shown
- etc.

### Video Captions:
Think about what each video shows:
- Wedding footage
- Anniversary celebrations
- Family trips
- Special moments
- Recent memories

---

## 🎊 Current Status

### ✅ Already Done:
- App structure ready
- Video player implemented
- Canva intro screen ready
- Video memories page ready

### 📝 You Need to Do:
1. Create `memories` folder
2. Rename videos
3. Copy videos to folders
4. Run the app!

---

## 🆘 Need Help?

### Video Not Playing?
- Check file name is exactly correct (lowercase, no spaces)
- Check file is MP4 format
- Try playing video outside app first (VLC player)

### Video Too Large?
- Compress using HandBrake
- Target 720p resolution
- Use H.264 codec

### Wrong Order?
- Rename files: video_01 is first, video_10 is last

---

## 📂 Quick Reference

| Video | File Name | Location | Purpose |
|-------|-----------|----------|---------|
| Canva Intro | `anniversary_invitation.mp4` | `assets/videos/` | Opening video |
| Memory 1 | `video_01.mp4` | `assets/videos/memories/` | First memory |
| Memory 2 | `video_02.mp4` | `assets/videos/memories/` | Second memory |
| Memory 3 | `video_03.mp4` | `assets/videos/memories/` | Third memory |
| Memory 4 | `video_04.mp4` | `assets/videos/memories/` | Fourth memory |
| Memory 5 | `video_05.mp4` | `assets/videos/memories/` | Fifth memory |
| Memory 6 | `video_06.mp4` | `assets/videos/memories/` | Sixth memory |
| Memory 7 | `video_07.mp4` | `assets/videos/memories/` | Seventh memory |
| Memory 8 | `video_08.mp4` | `assets/videos/memories/` | Eighth memory |
| Memory 9 | `video_09.mp4` | `assets/videos/memories/` | Ninth memory |
| Memory 10 | `video_10.mp4` | `assets/videos/memories/` | Tenth memory |

---

## 🎉 You're All Set!

Once you've added all 11 videos (1 Canva intro + 10 memories), your anniversary app will have:

✅ Beautiful Canva video introduction  
✅ 10 family memory videos  
✅ Professional video player  
✅ Full-screen viewing  
✅ Elegant transitions  
✅ Complete anniversary experience  

**Let me know when you've added the videos and I'll help you test them!** 🎊💖

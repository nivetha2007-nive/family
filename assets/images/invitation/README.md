# 📨 Canva Invitation Folder

## How to Add Your Canva Invitation

### Step 1: Export from Canva
1. Open your anniversary invitation design in Canva
2. Click **"Share"** or **"Download"**
3. Select **"PNG"** format (recommended) or **"JPG"**
4. Choose the highest quality/resolution
5. Download the file

### Step 2: Prepare the File
1. Locate the downloaded invitation file
2. **Rename it to exactly:** `anniversary_invitation.png`
   - Or: `anniversary_invitation.jpg` if you downloaded as JPG
3. Make sure the filename is in **lowercase**

### Step 3: Add to App
1. Copy the renamed file
2. Paste it into **this folder**: `assets/images/invitation/`
3. The final path should be:
   - `assets/images/invitation/anniversary_invitation.png`
   - OR `assets/images/invitation/anniversary_invitation.jpg`

### Step 4: Update Code (if using JPG)
If you're using JPG instead of PNG, update the file path in:
`lib/screens/canva_invitation_screen.dart`

Change line 27 from:
```dart
'assets/images/invitation/anniversary_invitation.png';
```

To:
```dart
'assets/images/invitation/anniversary_invitation.jpg';
```

### Step 5: Reload App
1. Stop the running app
2. Run: `flutter run -d chrome` (or your device)
3. Navigate to the invitation screen
4. Your Canva invitation will display!

---

## ✨ Features

Your Canva invitation will display with:
- ✅ **Complete visibility** - No cropping (BoxFit.contain)
- ✅ **Pinch to zoom** - Zoom in to see details
- ✅ **Pan after zooming** - Move around when zoomed
- ✅ **Proper aspect ratio** - Maintains your design proportions
- ✅ **Back button** - Easy navigation
- ✅ **Elegant presentation** - White background with shadow

---

## 📐 Recommended Canva Settings

For best results:
- **Size:** Any size works (e.g., 1080x1920, 1200x1600)
- **Format:** PNG (better quality) or JPG
- **Quality:** Highest available
- **Orientation:** Portrait or Landscape (app adapts automatically)

---

## 🐛 Troubleshooting

**Image not showing?**
- ✓ Check filename is exactly `anniversary_invitation.png` (or `.jpg`)
- ✓ Check file is in the correct folder
- ✓ Check file extension matches code (.png or .jpg)
- ✓ Try hot reload: Press `R` in the terminal
- ✓ Try full restart: Stop app and run again

**Image looks stretched?**
- The app uses BoxFit.contain - images should never stretch
- If it looks wrong, your image file might be corrupted
- Try re-exporting from Canva

**Want to use a PDF?**
- Export as PNG from Canva instead
- PDFs require additional packages and complexity
- PNG/JPG works perfectly for this use case

---

## 💡 Tips

- Keep a backup of your Canva invitation file
- Use high resolution for crisp details
- The app preserves your exact design - no modifications
- Test the zoom feature to ensure all text is readable
- The app supports any image dimensions

---

**Current Status:** Waiting for your Canva invitation image
**Expected File:** `anniversary_invitation.png` or `anniversary_invitation.jpg`

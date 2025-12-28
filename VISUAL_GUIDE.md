# Reel Simulator - Visual Guide

## App Screenshot Layout

```
╔═══════════════════════════════════════╗
║  ←                        📷         ║  ← Top Navigation
║                                       ║
║                                       ║
║                                       ║
║         [CAMERA FEED VIEW]            ║
║                                       ║
║     Live camera preview fills         ║
║     entire screen background          ║
║                                   ❤️  ║
║                                245K   ║  ← Like Button
║                                       ║
║                                   💬  ║
║                                1,432  ║  ← Comment Button
║                                       ║
║                                   ✈️  ║
║                               Share   ║  ← Share Button
║                                       ║
║                                   ⋯   ║  ← More Options
║                                       ║
║                                   🎵  ║  ← Audio (rotating)
║                                       ║
║  ●─────────────────────               ║
║  │ 👤 username  [Follow]              ║  ← User Profile
║                                       ║
║  Caption text goes here...            ║  ← Caption
║  #reels #instagram                    ║
║                                       ║
║  🎵 Original Audio - username         ║  ← Audio Info
║                                       ║
╚═══════════════════════════════════════╝
```

## Key Features Illustrated

### 1. **Camera Feed (Background)**
- Full-screen live camera preview
- Uses back camera by default
- HD quality (1920x1080)
- Aspect ratio fill to cover entire screen

### 2. **Top Bar (Semi-transparent)**
- **Left**: Back button (chevron)
- **Right**: Camera/switch button
- Overlays on top of camera feed
- Shadow for visibility

### 3. **Right Side Actions**
Each button includes:
- Icon (SF Symbol)
- Label/count below
- Semi-transparent background
- Touch-ready size (44x44pt)

### 4. **Bottom Left Info**
- **Profile Picture**: Gradient ring with avatar
- **Username**: White text with shadow
- **Follow Button**: Outlined button
- **Caption**: 2-line preview with hashtags
- **Audio**: Music note + track name

### 5. **Audio Thumbnail (Bottom Right)**
- Circular design
- Gradient border
- Rotating animation (3 seconds)
- Music note icon

## Screen Adaptations

### iPhone SE (Small - 4.7")
```
┌─────────────────┐
│  ←         📷  │
│                 │
│   [CAMERA]      │
│                 │
│            ❤️245K│
│            💬1.4K│
│            ✈️   │
│            ⋯    │
│            🎵   │
│                 │
│ 👤 user [Follow]│
│ Caption...      │
└─────────────────┘
```

### iPhone 14 Pro (Standard - 6.1")
```
┌───────────────────────┐
│  ←               📷  │
│                       │
│                       │
│     [CAMERA FEED]     │
│                       │
│                  ❤️   │
│                245K   │
│                  💬   │
│                1,432  │
│                  ✈️   │
│                Share  │
│                  ⋯    │
│                       │
│                  🎵   │
│                       │
│ 👤 username  [Follow] │
│ Caption text...       │
│ 🎵 Original Audio     │
└───────────────────────┘
```

### iPhone 15 Pro Max (Large - 6.7")
```
┌─────────────────────────────┐
│  ←                     📷  │
│                             │
│                             │
│       [CAMERA FEED]         │
│                             │
│                             │
│                        ❤️   │
│                      245K   │
│                        💬   │
│                      1,432  │
│                        ✈️   │
│                      Share  │
│                        ⋯    │
│                             │
│                        🎵   │
│                             │
│                             │
│ 👤 username    [Follow]     │
│ Caption text goes here...   │
│ 🎵 Original Audio - user    │
└─────────────────────────────┘
```

## Color Scheme

### Primary Colors
- **Background**: Live camera feed
- **UI Elements**: White (#FFFFFF)
- **Text**: White with shadow
- **Semi-transparent overlays**: Black @ 20% opacity

### Accent Colors
- **Gradients**: Purple → Pink → Orange
- **Audio ring**: Purple → Pink gradient
- **Profile ring**: Purple → Pink → Orange gradient

### Shadows
- All text has subtle black shadow for readability
- Icons have drop shadows for depth
- Ensures visibility against any camera background

## Interactive Elements (Future)

```
┌─────────────────────────────┐
│  [← Tap to go back]    [📷] │
│                             │
│    [Swipe up/down for       │
│     next/previous reel]     │
│                             │
│                      [❤️Tap]│  ← Double tap screen
│                             │     for quick like
│                      [💬Tap]│
│                             │
│                      [✈️Tap]│
│                             │
│ [Tap for user profile]      │
│ [Tap to expand caption]     │
└─────────────────────────────┘
```

## Component Hierarchy

```
ContentView (Root)
├── CameraView (Background layer)
│   └── CameraPreviewView (UIViewRepresentable)
│       └── AVCaptureVideoPreviewLayer
│
└── ReelOverlayView (Overlay layer)
    ├── Top Bar
    │   ├── Back Button
    │   └── Camera Button
    │
    ├── Right Action Buttons
    │   ├── Like (ActionButton)
    │   ├── Comment (ActionButton)
    │   ├── Share (ActionButton)
    │   ├── More (ActionButton)
    │   └── Audio (AudioThumbnail)
    │
    └── Bottom User Info
        ├── Profile Picture
        ├── Username
        ├── Follow Button (FollowButton)
        ├── Caption Text
        └── Audio Track Info
```

## Animation Details

### Audio Thumbnail
- **Type**: Continuous rotation
- **Duration**: 3 seconds per rotation
- **Easing**: Linear (no acceleration)
- **Loop**: Infinite
- **Direction**: Clockwise

### Future Animations
- Heart animation on like
- Button press feedback
- Swipe transitions
- Caption expand/collapse

## Responsive Spacing

The app uses percentage-based spacing:

```swift
// Bottom spacing adapts to screen height
Spacer().frame(height: geometry.size.height * 0.08)

// This means:
// - iPhone SE: 0.08 × 667pt = 53pt
// - iPhone 14: 0.08 × 844pt = 67pt  
// - iPhone 15 Pro Max: 0.08 × 926pt = 74pt
```

## Edge Cases Handled

✅ **No camera permission**: Shows message and Settings prompt  
✅ **Small screens**: UI scales proportionally  
✅ **Large screens**: More breathing room, same proportions  
✅ **Portrait only**: Locked to portrait orientation  
✅ **Status bar**: Hidden for immersive experience  
✅ **Safe areas**: Respected automatically by SwiftUI  

## Design Philosophy

1. **Non-intrusive**: UI doesn't block camera view
2. **Scannable**: Key actions on right side (thumb-friendly)
3. **Informative**: User info clearly visible
4. **Recognizable**: Matches Instagram Reel patterns
5. **Adaptive**: Works on all iPhone sizes
6. **Vector-based**: Sharp on all screen densities

## Technical Implementation

- **SwiftUI**: Declarative UI framework
- **SF Symbols**: Native iOS icons
- **GeometryReader**: Responsive sizing
- **ZStack**: Layered composition
- **@State**: Animation state management
- **Shadow modifiers**: Text legibility
- **Frame modifiers**: Precise positioning

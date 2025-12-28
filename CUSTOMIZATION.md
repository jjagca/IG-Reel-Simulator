# UI Customization Guide

## Overview

The Reel Simulator UI is built with modular SwiftUI components that use vector graphics (SF Symbols) for resolution independence. All UI elements are defined in `ReelOverlayView.swift`.

## UI Layout Structure

```
┌─────────────────────────────────┐
│ ← Back              Camera 📷   │  <- Top Bar
│                                 │
│                                 │
│                                 │
│                                 │
│                          ♥ 245K│  <- Action Buttons
│                          💬 1.4K│     (Right Side)
│                          ➤ Share│
│                          ⋯      │
│                          🎵     │  <- Audio Thumbnail
│                                 │
│                                 │
│ 👤 username [Follow]            │  <- User Info
│ Caption text...                 │     (Bottom Left)
│ 🎵 Original Audio               │
└─────────────────────────────────┘
```

## Customizing Components

### 1. Action Buttons (Right Side)

Location: `ReelOverlayView.swift` - Inside right-side VStack

**Current Implementation:**
```swift
ActionButton(icon: "heart", label: "245K")
ActionButton(icon: "message", label: "1,432")
ActionButton(icon: "paperplane", label: "Share")
ActionButton(icon: "ellipsis", label: "")
```

**Customization Options:**

Change icon:
```swift
ActionButton(icon: "star.fill", label: "245K")  // Star instead of heart
```

Change label:
```swift
ActionButton(icon: "heart", label: "500K")  // Different count
```

Add new button:
```swift
ActionButton(icon: "bookmark", label: "Save")  // Add bookmark button
```

Modify spacing:
```swift
VStack(spacing: 32) {  // Increase from default 24
    // buttons here
}
```

### 2. Button Appearance

Location: `ActionButton` struct in `ReelOverlayView.swift`

**Circle background size:**
```swift
Circle()
    .fill(Color.black.opacity(0.2))
    .frame(width: 50, height: 50)  // Increase from 44
```

**Icon size:**
```swift
Image(systemName: icon)
    .font(.system(size: 28, weight: .regular))  // Increase from 24
```

**Label style:**
```swift
Text(label)
    .font(.system(size: 12, weight: .bold))  // Change from medium
    .foregroundColor(.pink)  // Change color
```

### 3. User Info Section (Bottom Left)

Location: `ReelOverlayView.swift` - Bottom VStack

**Profile Picture:**

Change size:
```swift
Circle()
    .fill(gradient)
    .frame(width: 50, height: 50)  // Increase from 40
```

Change gradient colors:
```swift
LinearGradient(
    colors: [.blue, .cyan, .green],  // Custom colors
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)
```

**Username:**

Change text:
```swift
Text("your_username")
    .font(.system(size: 16, weight: .bold))  // Larger and bolder
```

**Caption:**

Change style:
```swift
Text("Your caption here...")
    .font(.system(size: 14))
    .foregroundColor(.white)
    .lineLimit(3)  // Show more lines
    .padding(.top, 4)
```

### 4. Follow Button

Location: `FollowButton` struct

**Styling:**
```swift
Text("Follow")
    .font(.system(size: 14, weight: .bold))  // Bolder
    .foregroundColor(.black)  // Black text
    .padding(.horizontal, 20)  // Wider
    .padding(.vertical, 8)  // Taller
    .background(
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)  // Filled background
    )
```

### 5. Audio Thumbnail (Bottom Right)

Location: `AudioThumbnail` struct

**Animation Speed:**
```swift
Animation.linear(duration: 5)  // Slower rotation (increase from 3)
```

**Size:**
```swift
Circle()
    .strokeBorder(gradient, lineWidth: 3)  // Thicker border
    .frame(width: 52, height: 52)  // Larger outer circle

Circle()
    .fill(gradient)
    .frame(width: 40, height: 40)  // Larger inner circle
```

**Colors:**
```swift
LinearGradient(
    colors: [.blue, .cyan],  // Different gradient
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)
```

### 6. Top Bar

Location: `ReelOverlayView.swift` - Top VStack

**Back Button:**
```swift
Image(systemName: "chevron.left")
    .font(.system(size: 24, weight: .bold))  // Larger, bolder
    .foregroundColor(.pink)  // Different color
```

**Camera Button:**
```swift
Image(systemName: "video.fill")  // Video icon instead
    .font(.system(size: 24))
```

**Add Title/Text:**
```swift
HStack {
    Image(systemName: "chevron.left")
    Spacer()
    Text("Reels")  // Add center title
        .font(.system(size: 18, weight: .semibold))
        .foregroundColor(.white)
    Spacer()
    Image(systemName: "camera")
}
```

### 7. Spacing and Positioning

**Bottom spacing (User Info):**
```swift
Spacer()
    .frame(height: geometry.size.height * 0.10)  // Adjust from 0.08
```

**Right side bottom spacing:**
```swift
Spacer()
    .frame(height: geometry.size.height * 0.20)  // Adjust from 0.15
```

**Horizontal padding:**
```swift
.padding(.trailing, 20)  // More space from edge
.padding(.leading, 20)   // More space from edge
```

## SF Symbols Reference

Common icons used in Instagram Reels:

| Symbol | Description |
|--------|-------------|
| `heart` | Like (outline) |
| `heart.fill` | Like (filled) |
| `message` | Comment |
| `paperplane` | Share/Send |
| `bookmark` | Save |
| `ellipsis` | More options |
| `music.note` | Audio/Music |
| `camera` | Camera |
| `video` | Video |
| `chevron.left` | Back |
| `chevron.right` | Forward |
| `person.fill` | User profile |
| `star` | Favorite |
| `play.fill` | Play |
| `pause.fill` | Pause |

Browse all symbols: [SF Symbols App](https://developer.apple.com/sf-symbols/)

## Color Customization

### Predefined Colors:
```swift
.foregroundColor(.white)
.foregroundColor(.black)
.foregroundColor(.gray)
.foregroundColor(.red)
.foregroundColor(.pink)
.foregroundColor(.purple)
.foregroundColor(.blue)
.foregroundColor(.cyan)
.foregroundColor(.green)
.foregroundColor(.yellow)
.foregroundColor(.orange)
```

### Custom Colors:
```swift
.foregroundColor(Color(red: 0.9, green: 0.1, blue: 0.5))
.foregroundColor(Color(hex: "#FF69B4"))  // Requires extension
```

### Gradients:
```swift
LinearGradient(
    colors: [.purple, .pink, .orange],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

RadialGradient(
    colors: [.blue, .purple],
    center: .center,
    startRadius: 2,
    endRadius: 50
)
```

## Responsive Design

The UI uses GeometryReader for responsive layouts:

```swift
GeometryReader { geometry in
    // Use geometry.size.width and geometry.size.height
    Spacer().frame(height: geometry.size.height * 0.15)
}
```

This ensures the UI adapts to:
- iPhone SE (Small)
- iPhone 14/15 (Standard)
- iPhone 14/15 Pro Max (Large)

## Adding New UI Components

1. **Create a new struct:**
```swift
struct MyCustomButton: View {
    var body: some View {
        // Your UI code
    }
}
```

2. **Add to ReelOverlayView:**
```swift
ZStack {
    // Existing UI
    MyCustomButton()
}
```

3. **Position it:**
```swift
MyCustomButton()
    .frame(maxWidth: .infinity, alignment: .trailing)
    .padding(.trailing, 20)
```

## Testing Changes

Use SwiftUI Previews for quick iteration:

```swift
struct ReelOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray  // Simulated camera background
            ReelOverlayView()
        }
        .previewDevice("iPhone 14 Pro")
    }
}
```

## Common Customizations

### Make UI elements larger:
- Increase `.frame(width:height:)` values
- Increase `.font(.system(size:))` values
- Increase `.padding()` values

### Change colors:
- Modify `.foregroundColor()`
- Change gradient colors
- Adjust `.opacity()` values

### Adjust positioning:
- Change `.padding()` values
- Modify `alignment:` parameters
- Adjust `spacing:` in stacks

### Add animations:
- Use `.animation()` modifier
- Add `.rotationEffect()`, `.scaleEffect()`
- Use `@State` for interactive animations

## Best Practices

✅ Use SF Symbols for icons (scales automatically)  
✅ Use relative sizing with GeometryReader  
✅ Use color opacity for semi-transparent overlays  
✅ Use shadows for text readability over camera  
✅ Test on multiple device sizes  
✅ Keep modular component structure  

## Need Help?

- **SF Symbols:** Download the free SF Symbols app from Apple
- **SwiftUI Docs:** [developer.apple.com/documentation/swiftui](https://developer.apple.com/documentation/swiftui)
- **Colors:** Use Color Picker in Xcode for custom colors
- **Layout:** Use Xcode Previews for visual feedback

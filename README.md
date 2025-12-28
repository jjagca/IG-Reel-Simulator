# Reel Simulator - iOS App

An iOS application that replicates the Instagram Reel interface overlaid on the live iPhone camera feed. Built with SwiftUI and AVFoundation.

## Features

- **Live Camera Feed**: Real-time camera preview using AVFoundation
- **Instagram Reel UI Overlay**: Vector-based UI mimicking Instagram's Reel interface
- **Responsive Design**: Adapts seamlessly to all iPhone screen sizes and aspect ratios
- **Easy UI Customization**: Modular SwiftUI components for simple UI updates
- **Performance Optimized**: Efficient camera session management on background queue
- **Best Practices**: Follows iOS app development best practices

## Project Structure

```
ReelSimulator/
├── ReelSimulator.xcodeproj/     # Xcode project file
└── ReelSimulator/
    ├── ReelSimulatorApp.swift   # App entry point
    ├── ContentView.swift         # Main view combining camera and overlay
    ├── Camera/
    │   ├── CameraManager.swift  # AVFoundation camera session manager
    │   └── CameraView.swift     # SwiftUI camera preview wrapper
    ├── Overlay/
    │   └── ReelOverlayView.swift # Instagram Reel UI overlay
    ├── Assets.xcassets/          # App assets and colors
    ├── Info.plist               # App configuration
    └── Preview Content/          # SwiftUI preview assets
```

## Requirements

- iOS 15.0 or later
- Xcode 14.0 or later
- Swift 5.0 or later
- iPhone device with camera (or Simulator for UI testing)

## Installation & Building

1. Clone the repository:
   ```bash
   git clone https://github.com/jjagca/IG-Reel-Simulator.git
   cd IG-Reel-Simulator
   ```

2. Open the project in Xcode:
   ```bash
   open ReelSimulator/ReelSimulator.xcodeproj
   ```

3. Select your target device or simulator

4. Build and run the project:
   - Press `Cmd + R` or click the Run button
   - For real device: Connect your iPhone and select it as the target

## Camera Permissions

The app requires camera access to function. On first launch:
1. The app will request camera permission
2. Grant access to enable the camera feed
3. If denied, enable it manually in Settings > Privacy > Camera

The camera permission message is configured in `Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>This app requires camera access to display the camera feed with Instagram Reel-style interface.</string>
```

## Customizing the UI

The UI overlay is built with modular SwiftUI components in `ReelOverlayView.swift`:

### Main Components:

1. **ActionButton**: Like, comment, share buttons
   ```swift
   ActionButton(icon: "heart", label: "245K")
   ```

2. **FollowButton**: User follow button
   ```swift
   FollowButton()
   ```

3. **AudioThumbnail**: Rotating audio/music indicator
   ```swift
   AudioThumbnail()
   ```

### Customization Examples:

**Change button icons:**
```swift
ActionButton(icon: "star.fill", label: "Favorite")
```

**Modify colors:**
```swift
.foregroundColor(.pink)  // Change button color
```

**Adjust spacing:**
```swift
VStack(spacing: 32) {  // Increase spacing between elements
```

**Update text content:**
```swift
Text("Your custom caption here")
    .font(.system(size: 14))
```

### Using SF Symbols

All icons use Apple's SF Symbols for native iOS look:
- `heart` - Like button
- `message` - Comment button
- `paperplane` - Share button
- `music.note` - Audio indicator

Browse available symbols at [SF Symbols](https://developer.apple.com/sf-symbols/)

## Architecture

### Camera Management
- **CameraManager**: Handles AVCaptureSession lifecycle
  - Authorization checking and requesting
  - Session configuration with HD quality presets
  - Background queue for session operations
  - Start/stop session management

- **CameraView**: SwiftUI view wrapper
  - UIViewRepresentable for AVCaptureVideoPreviewLayer
  - Automatic session start/stop on appear/disappear
  - Fallback UI for denied camera access

### UI Overlay
- **ReelOverlayView**: Main overlay component
  - GeometryReader for responsive layout
  - ZStack architecture for layered UI
  - Positioned elements using frame and padding
  - Adapts to different screen sizes automatically

## Responsive Design

The app uses SwiftUI's GeometryReader to adapt to different iPhone models:

```swift
GeometryReader { geometry in
    // UI elements use geometry.size for responsive sizing
    Spacer().frame(height: geometry.size.height * 0.15)
}
```

This ensures proper spacing and positioning across:
- iPhone SE (4.7" display)
- iPhone 14, 15 (6.1" display)
- iPhone 14 Pro Max, 15 Pro Max (6.7" display)
- Future iPhone models

## Development Notes

### Testing Without Device
- Use Xcode Simulator for UI testing
- Camera feed will show black screen in Simulator
- All UI elements are visible and interactive

### Adding New UI Elements
1. Create a new SwiftUI View component
2. Add it to the appropriate layer in `ReelOverlayView`
3. Use vector graphics (SF Symbols, Shapes) for scalability

### Performance Considerations
- Camera session runs on background queue (`camera.session.queue`)
- UI updates happen on main thread
- Video preview uses `.resizeAspectFill` for optimal display

## Best Practices Implemented

✅ **SwiftUI Native**: Modern declarative UI framework  
✅ **MVVM Pattern**: Separation of concerns (Manager + View)  
✅ **Responsive Layout**: Geometry-based adaptive design  
✅ **Permission Handling**: Proper camera authorization flow  
✅ **Resource Management**: Session lifecycle management  
✅ **Modular Components**: Reusable UI elements  
✅ **Vector Graphics**: SF Symbols for resolution independence  
✅ **Dark Mode**: Supports system appearance  
✅ **Thread Safety**: Background queue for camera operations  

## Future Enhancements

Potential features to add:
- Custom SVG asset loading system
- Interactive button actions
- Video recording capability
- Gesture support (swipe, tap interactions)
- Multiple camera switching
- Filter effects
- Animation controls

## Troubleshooting

**Black screen on device:**
- Check camera permissions in Settings
- Ensure device has a working camera
- Try restarting the app

**Build errors:**
- Clean build folder (Cmd + Shift + K)
- Update Xcode to latest version
- Check deployment target is iOS 15.0+

**UI not visible:**
- Check status bar is hidden
- Verify overlay is above camera layer
- Ensure colors contrast with camera feed

## License

See LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## Author

Created for Instagram Reel interface simulation on iOS devices. 

//
//  ReelOverlayView.swift
//  ReelSimulator
//
//  Instagram Reel-style UI overlay with vector graphics
//  Designed for easy customization and adaptation to different screen sizes
//

import SwiftUI

struct ReelOverlayView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Right side action buttons
                VStack(spacing: 24) {
                    Spacer()
                    
                    // Like button
                    ActionButton(
                        icon: "heart",
                        label: "245K"
                    )
                    
                    // Comment button
                    ActionButton(
                        icon: "message",
                        label: "1,432"
                    )
                    
                    // Share button
                    ActionButton(
                        icon: "paperplane.fill",
                        label: "Share"
                    )
                    
                    // More options button
                    ActionButton(
                        icon: "ellipsis",
                        label: ""
                    )
                    
                    // Audio/Music thumbnail
                    AudioThumbnail()
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.15)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 12)
                
                // Bottom left user info and caption
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    
                    HStack(spacing: 12) {
                        // Profile picture
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.purple, .pink, .orange],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 36, height: 36)
                            )
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            )
                        
                        // Username
                        Text("username")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                        
                        // Follow button
                        FollowButton()
                    }
                    
                    // Caption
                    Text("Caption text goes here... #reels #instagram")
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .padding(.top, 2)
                    
                    // Audio info
                    HStack(spacing: 4) {
                        Image(systemName: "music.note")
                            .font(.system(size: 11))
                        Text("Original Audio - username")
                            .font(.system(size: 12))
                    }
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.08)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.trailing, 80)
                
                // Top bar
                VStack(spacing: 0) {
                    HStack {
                        // Back button
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                        
                        Spacer()
                        
                        // Camera button
                        Image(systemName: "camera")
                            .font(.system(size: 22, weight: .regular))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    
                    Spacer()
                }
            }
        }
    }
}

/// Action button component (like, comment, share, etc.)
struct ActionButton: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .fill(Color.black.opacity(0.2))
                    .frame(width: 44, height: 44)
                
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
            }
            
            if !label.isEmpty {
                Text(label)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 0.5)
            }
        }
    }
}

/// Follow button component
struct FollowButton: View {
    var body: some View {
        Text("Follow")
            .font(.system(size: 13, weight: .semibold))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.white, lineWidth: 1.5)
            )
    }
}

/// Animated audio thumbnail component
struct AudioThumbnail: View {
    @State private var isRotating = false
    
    var body: some View {
        ZStack {
            // Outer ring
            Circle()
                .strokeBorder(
                    LinearGradient(
                        colors: [.purple, .pink],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                )
                .frame(width: 44, height: 44)
            
            // Inner album art
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.purple.opacity(0.8), .pink.opacity(0.8)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 32, height: 32)
                .overlay(
                    Image(systemName: "music.note")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                )
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .animation(
                    Animation.linear(duration: 3)
                        .repeatForever(autoreverses: false),
                    value: isRotating
                )
                .onAppear {
                    isRotating = true
                }
        }
    }
}

struct ReelOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ReelOverlayView()
        }
        .previewDevice("iPhone 14 Pro")
        
        ZStack {
            Color.gray
            ReelOverlayView()
        }
        .previewDevice("iPhone SE (3rd generation)")
        
        ZStack {
            Color.gray
            ReelOverlayView()
        }
        .previewDevice("iPhone 14 Pro Max")
    }
}

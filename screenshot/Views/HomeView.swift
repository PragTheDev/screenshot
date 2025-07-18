//
//  HomeView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct HomeView: View {
    @State private var animateWelcome = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // Welcome Header
                VStack(spacing: 16) {
                    Image(systemName: "camera.aperture")
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .scaleEffect(animateWelcome ? 1.0 : 0.8)
                        .animation(.easeOut(duration: 0.8), value: animateWelcome)
                    
                    Text("Welcome to ScreenCraft")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("Transform your boring screenshots into professional-quality images that stand out on social media")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                .opacity(animateWelcome ? 1.0 : 0.0)
                .animation(.easeOut(duration: 1.0).delay(0.2), value: animateWelcome)
                
                // Feature Cards
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    FeatureCard(
                        icon: "camera.fill",
                        title: "Smart Capture",
                        description: "Capture screenshots with precision and ease",
                        color: .blue
                    )
                    
                    FeatureCard(
                        icon: "wand.and.stars",
                        title: "Pro Effects",
                        description: "Add backgrounds, shadows, and professional touches",
                        color: .purple
                    )
                    
                    FeatureCard(
                        icon: "photo.on.rectangle",
                        title: "Library Management",
                        description: "Organize and manage all your screenshots",
                        color: .green
                    )
                    
                    FeatureCard(
                        icon: "square.and.arrow.up",
                        title: "Export Options",
                        description: "Export in multiple formats and sizes",
                        color: .orange
                    )
                }
                .padding(.horizontal, 40)
                
                // Quick Actions
                VStack(spacing: 16) {
                    Text("Quick Actions")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 16) {
                        QuickActionButton(
                            icon: "camera.fill",
                            title: "New Screenshot",
                            color: .blue
                        ) {
                            // TODO: Navigate to capture
                        }
                        
                        QuickActionButton(
                            icon: "folder.fill",
                            title: "Open Library",
                            color: .green
                        ) {
                            // TODO: Navigate to library
                        }
                    }
                }
                
                Spacer(minLength: 40)
            }
            .padding(.top, 60)
        }
        .onAppear {
            animateWelcome = true
        }
    }
}

struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                
                Spacer()
            }
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(NSColor.controlBackgroundColor))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
    }
}

struct QuickActionButton: View {
    let icon: String
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(color)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView()
        .frame(width: 800, height: 600)
}

//
//  LibraryView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct LibraryView: View {
    @Binding var screenshots: [ScreenshotItem]
    
    var body: some View {
        VStack(spacing: 32) {
            Text("📚 Screenshot Library")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            if screenshots.isEmpty {
                VStack(spacing: 16) {
                    Image(systemName: "photo.on.rectangle")
                        .font(.system(size: 60))
                        .foregroundColor(.secondary)
                    
                    Text("No screenshots yet")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    
                    Text("Capture your first screenshot to get started!")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            } else {
                // TODO: Screenshot grid will go here
                Text("Screenshots: \(screenshots.count)")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LibraryView(screenshots: .constant([]))
}

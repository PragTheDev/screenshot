//
//  MainContentView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct MainContentView: View {
    let selectedTab: SidebarTab
    @Binding var screenshots: [ScreenshotItem]
    
    var body: some View {
        Group {
            switch selectedTab {
            case .home:
                HomeView()
            case .capture:
                CaptureView()
            case .library:
                LibraryView(screenshots: $screenshots)
            case .effects:
                EffectsView()
            case .export:
                ExportView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(NSColor.controlBackgroundColor).opacity(0.3))
    }
}

#Preview {
    MainContentView(selectedTab: .home, screenshots: .constant([]))
        .frame(width: 750, height: 500)
}

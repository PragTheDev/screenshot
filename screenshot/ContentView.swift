//
//  ContentView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - State Variables
    @State private var selectedTab: SidebarTab = .home
    @State private var screenshots: [ScreenshotItem] = []
    
    var body: some View {
        NavigationSplitView {
            // Sidebar
            SidebarView(selectedTab: $selectedTab)
                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
        } detail: {
            // Main Content Area
            MainContentView(selectedTab: selectedTab, screenshots: $screenshots)
        }
        .navigationSplitViewStyle(.balanced)
        .onAppear {
            loadSampleData()
        }
    }
    
    private func loadSampleData() {

        screenshots = []
    }
}

// MARK: - Supporting Types
enum SidebarTab: String, CaseIterable, Identifiable {
    case home = "Home"
    case capture = "Capture"
    case library = "Library"
    case effects = "Effects"
    case export = "Export"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .capture: return "camera.fill"
        case .library: return "photo.on.rectangle"
        case .effects: return "wand.and.stars"
        case .export: return "square.and.arrow.up"
        }
    }
}

struct ScreenshotItem: Identifiable {
    let id = UUID()
    let name: String
    let image: NSImage
    let dateCreated: Date
    let size: CGSize
}

#Preview {
    ContentView()
        .frame(width: 1000, height: 700)
}

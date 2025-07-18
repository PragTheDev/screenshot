//
//  SidebarView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selectedTab: SidebarTab
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // App Header
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "camera.aperture")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading) {
                        Text("Screenshot")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Professional Screenshots")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                Divider()
                    .padding(.horizontal)
            }
            
            // Navigation Items
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 2) {
                    ForEach(SidebarTab.allCases) { tab in
                        SidebarButton(
                            tab: tab,
                            isSelected: selectedTab == tab
                        ) {
                            selectedTab = tab
                        }
                    }
                }
                .padding(.horizontal, 8)
                .padding(.top, 16)
            }
            
            Spacer()
            
            // Footer
            VStack(alignment: .leading, spacing: 8) {
                Divider()
                    .padding(.horizontal)
                
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(.secondary)
                    Text("Version 1.0")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
        }
        .background(Color(NSColor.controlBackgroundColor))
    }
}

struct SidebarButton: View {
    let tab: SidebarTab
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: tab.icon)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isSelected ? .white : .primary)
                    .frame(width: 20)
                
                Text(tab.rawValue)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(isSelected ? .white : .primary)
                
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? Color.blue : Color.clear)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SidebarView(selectedTab: .constant(.home))
        .frame(width: 250, height: 500)
}

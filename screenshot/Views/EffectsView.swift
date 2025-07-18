//
//  EffectsView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct EffectsView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("✨ Effects & Styling")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Professional effects and styling options coming soon!")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EffectsView()
}

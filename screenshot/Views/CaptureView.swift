//
//  CaptureView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct CaptureView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("📸 Capture Screenshots")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Screenshot capture functionality coming soon!")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    CaptureView()
}

//
//  ExportView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct ExportView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("📤 Export & Share")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Export and sharing functionality coming soon!")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ExportView()
}

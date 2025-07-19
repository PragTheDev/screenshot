//
//  CaptureView.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import SwiftUI

struct CaptureView: View {
    @State private var capturedImage: NSImage?
    @State private var isCapturing = false
    
    var body: some View {
        VStack(spacing: 32) {
            Text("📸 Capture Screenshots")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Capture Buttons
            HStack(spacing: 24) {
                Button("Capture Full Screen") {
                    captureFullScreen()
                }
                .buttonStyle(.borderedProminent)
                .disabled(isCapturing)
                
                Button("Capture Window") {
                    captureWindow()
                }
                .buttonStyle(.bordered)
                .disabled(isCapturing)
            }
            
            if isCapturing {
                ProgressView("Capturing...")
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            // Show captured image
            if let image = capturedImage {
                VStack(spacing: 16) {
                    Text("Captured Screenshot")
                        .font(.headline)
                    
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 400, maxHeight: 300)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    
                    Button("Save to Desktop") {
                        saveToDesktop(image)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func captureFullScreen() {
        isCapturing = true
        
        DispatchQueue.global().async {
            let image = ScreenshotCapture.captureFullScreen()
            
            DispatchQueue.main.async {
                self.capturedImage = image
                self.isCapturing = false
            }
        }
    }
    
    private func captureWindow() {
        isCapturing = true
        
        DispatchQueue.global().async {
            let image = ScreenshotCapture.captureWindow()
            
            DispatchQueue.main.async {
                self.capturedImage = image
                self.isCapturing = false
            }
        }
    }
    
    private func saveToDesktop(_ image: NSImage) {
        let desktop = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
        let fileName = "Screenshot_\(Date().timeIntervalSince1970).png"
        let fileURL = desktop.appendingPathComponent(fileName)
        
        if let tiffData = image.tiffRepresentation,
           let bitmapImage = NSBitmapImageRep(data: tiffData),
           let pngData = bitmapImage.representation(using: .png, properties: [:]) {
            try? pngData.write(to: fileURL)
        }
    }
}

#Preview {
    CaptureView()
}

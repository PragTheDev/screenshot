//
//  ScreenshotCapture.swift
//  screenshot
//
//  Created by Praghilan Sudhakar on 7/18/25.
//

import Foundation
import AppKit

class ScreenshotCapture {
    
    static func captureFullScreen() -> NSImage? {
        // Use the system screenshot command as a workaround
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        
        // Create temporary file
        let tempDir = NSTemporaryDirectory()
        let fileName = "temp_screenshot_\(Date().timeIntervalSince1970).png"
        let filePath = tempDir + fileName
        
        task.arguments = ["-x", filePath] // -x removes sound
        
        do {
            try task.run()
            task.waitUntilExit()
            
            if task.terminationStatus == 0 {
                let image = NSImage(contentsOfFile: filePath)
                // Clean up temp file
                try? FileManager.default.removeItem(atPath: filePath)
                return image
            }
        } catch {
            print("Screenshot failed: \(error)")
        }
        
        return nil
    }
    
    static func captureWindow() -> NSImage? {
        // For simplicity, capture full screen for now
        // In a real app, you'd use ScreenCaptureKit for window capture
        return captureFullScreen()
    }
}

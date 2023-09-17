//
//  SelectApps.swift
//  warnBeforeQuit
//
//  Created by 李佳颖 on 2023/9/8.
//

import Cocoa
import UniformTypeIdentifiers

class ViewController: NSViewController {
    @IBAction func chooseanApp(_ sender: NSButton) {
        print("Initializing panel...")
        let openPanel = NSOpenPanel()
        openPanel.title = "Choose Application"
        openPanel.showsHiddenFiles = false
        if let appType = UTType.init("com.apple.application"){
            openPanel.allowedContentTypes = [appType]
        }
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        let response = openPanel.runModal()
        guard response == .OK, let url = openPanel.url else { return }
        appURLs.insert(url)

    }
}

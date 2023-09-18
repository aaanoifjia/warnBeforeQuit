//
//  SelectApps.swift
//  warnBeforeQuit
//
//  Created by 李佳颖 on 2023/9/8.
//

import Cocoa
import UniformTypeIdentifiers


class ViewController: NSViewController {
    enum selectPanel: Error{
        case selectFail
    }
    func chooseanApp(_ sender: NSButton) -> [URL]{
        print("Initializing panel...")
        let openPanel = NSOpenPanel()
        openPanel.title = "Choose Application"
        openPanel.showsHiddenFiles = false
        if let appType = UTType.init("com.apple.application"){
            openPanel.allowedContentTypes = [appType]
        }
        openPanel.allowsMultipleSelection = true
        openPanel.canChooseDirectories = false
        if openPanel.runModal() == .OK{
            let urls = openPanel.urls
            return urls
        }
        return []
    }
}

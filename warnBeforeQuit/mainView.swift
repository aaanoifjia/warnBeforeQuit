//
//  ContentView.swift
//  warnBeforeQuit
//
//  Created by 李佳颖 on 2023/9/8.
//

import SwiftUI

struct mainView: View {
    @State var isOn = false
    @State var disableQuit = false
    @State var warn = false
    var body: some View {
        
        VStack{
            Toggle(isOn: $isOn) {
            Label: do {
                Text(isOn ? "ON" : "OFF")
                }
            }
            .toggleStyle(.button)
            .onTapGesture{
                self.isOn = !self.isOn
            }
            .frame(width: 180)
            
            HStack{
                Toggle(isOn: $disableQuit) {
                    Label: do {
                        Text(disableQuit ? "Quit disabled" : "Quit not disabled")
                    }
                }
                .toggleStyle(.button)
                .onTapGesture{
                    self.disableQuit = !self.disableQuit
                }
                
                Toggle(isOn: $warn) {
                    Label: do {
                        Text("Warn")
                    }
                }
                .toggleStyle(.button)
                .onTapGesture{
                    self.warn = !self.warn
                }
            }
            AppView()
        }
            .padding()
            .frame(minWidth: 200, minHeight: 200)
    }
}

struct mainView_preview: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}



func getAppName(from url: URL) -> String? {
    if let appBundle = Bundle(url: url),
       let appName = appBundle.object(forInfoDictionaryKey: "CFBundleName") as? String {
        return appName
    }
    return nil
}

struct AppView: View {
    @State private var appURLs = Set<URL>()
    func openSelectionPanel() {

        // Handle button tap event
        print("Openning selection panel...")
        
        let viewController = ViewController()
        print("vieController initialized")
        let urls = viewController.chooseanApp(NSButton())
        if !(urls.isEmpty){
            appURLs.formUnion(urls)
        }
    }
    let cols: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]

    var body: some View {
        VStack{
            Button(
                action: { openSelectionPanel(); print(appURLs)})
            {Label: do { Text("Add App")}}
            
            ScrollView(){
                LazyVGrid(columns: cols){
                    ForEach(Array(appURLs), id: \.self){ app in
                        VStack {
                            let icon = NSWorkspace.shared.icon(forFile: app.path)
                            Image(nsImage: icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)

    //                        } else{
    //                            Image(systemName: "app")
    //                                .resizable()
    //                                .aspectRatio(contentMode: .fit)
    //                                .frame(width: 50, height: 50)
    //                        }
    //                        let appName = app.lastPathComponent
    //                        Text(appName)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}



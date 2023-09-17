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


var appURLs = Set<URL>()

struct AppView: View{

    var body: some View {
        Button(action: {
            task{
                await openSelectionPanel()
                print(appURLs)
            }
                }) {
                    // Button label
                    Text("Add App")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            func openSelectionPanel() {
                // Handle button tap event
                print("Openning selection panel...")
                
                let viewController = ViewController()
                print("vieController initialized")
                viewController.chooseanApp(NSButton())
            }
    }

//
//  Google_Cloud_SpeechToTextApp.swift
//  Google-Cloud-SpeechToText
//
//  Created by Abdullah Kardaş on 20.06.2024.
//

import SwiftUI

@main
struct MainApp: App {
    
    @State var state = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(state)
        }
    }
}

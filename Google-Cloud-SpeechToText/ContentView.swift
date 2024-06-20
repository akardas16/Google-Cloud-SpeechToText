//
//  ContentView.swift
//  Google-Cloud-SpeechToText
//
//  Created by Abdullah Kardaş on 20.06.2024.
//

import SwiftUI
import PermissionsKit
import MicrophonePermission

struct ContentView: View {
    
    @Environment(MainViewModel.self) var state:MainViewModel
    
    var body: some View {
        VStack(spacing:100) {
            Text(state.recognitionText).font(.title3).bold().padding().multilineTextAlignment(.center)
            
            Circle().fill(state.isStreaming ? Color.red : Color.cyan)
                .frame(width: 72, height: 72)
                .shadow(radius: 8)
                .overlay {
                    Image(systemName: state.isStreaming ? "pause.fill" : "play.fill")
                        .foregroundStyle(.white).font(.system(size: 36))
                }.onTapWithBounce {
                    if state.isStreaming {
                        state.stopRecognition()
                    }else {
                        state.startRecognition()
                    }
                }
        }.onAppear{
            let authorized = Permission.microphone.authorized
            if !authorized {
                Permission.microphone.request{
                    
                }
            }
            
            
        }
    
    }
}

#Preview {
    ContentView().environment(MainViewModel())
}

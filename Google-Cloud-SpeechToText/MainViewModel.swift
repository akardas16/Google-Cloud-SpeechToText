//
//  MainViewModel.swift
//  Google-Cloud-SpeechToText
//
//  Created by Abdullah Kardaş on 20.06.2024.
//

import SwiftUI
import UIKit
import Observation
import Foundation
import AVFoundation
import Combine
import Speech
import googleapis


@Observable
class MainViewModel {
    
    var recognitionText = "Tap to start Recognition"
    var isStreaming = false
    private var cancellables = Set<AnyCancellable>()
    
    
    
    func startRecognition(){
        AudioController.sharedInstance.recordAudio()
        isStreaming = true
        AudioController.sharedInstance
            .textReceivedPublisher.sink {[weak self] text in
                self?.recognitionText = text
                print(text)
        }.store(in: &cancellables)
    }
    
    func stopRecognition(){
        for i in cancellables{
            i.cancel()
        }
        cancellables.removeAll()
        isStreaming = false
        AudioController.sharedInstance.stopAudio()
    }
}

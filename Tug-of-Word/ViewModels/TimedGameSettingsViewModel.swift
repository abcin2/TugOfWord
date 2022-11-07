//
//  TimedGameSettingsViewModel.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 11/6/22.
//

import SwiftUI

extension TimedGameSettingsView {
    
    class TimedGameSettingsViewModel: ObservableObject {
        
        @Published var gameMinutesAsString: String = "1"
        @Published var gameSecondsAsString: String = "30"
        @Published var wordLength: String = "3"
        
        // will be called on every change of the textfield
        func validateGameTimeAsInt(timeString: String) -> Int {
            if Int(timeString) != nil {
                return Int(timeString) ?? 30
            }
            
            return 30
        }
        
        func useDefaults() {
            gameMinutesAsString = "1"
            gameSecondsAsString = "30"
            wordLength = "3"
        }
        
    }
    
}

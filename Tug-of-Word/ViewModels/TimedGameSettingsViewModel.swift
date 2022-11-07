//
//  TimedGameSettingsViewModel.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 11/6/22.
//

import SwiftUI

extension TimedGameSettingsView {
    
    class TimedGameSetingsViewModel: ObservableObject {
        
        @Published var gameTimeAsString: String = "30"
        @Published var wordLength: Int = 3
        
        // will be called on every change of the textfield
        func validateGameTimeAsInt(timeString: String) -> Int {
            if Int(timeString) != nil {
                return Int(timeString) ?? 30
            }
            
            return 30
        }
        
    }
    
}

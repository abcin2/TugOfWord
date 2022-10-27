//
//  SettingsViewModel.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/27/22.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    
    public class KeyboardTheme {
        let keyColor: Color
        let charColor: Color
        
        init(theme: KeyboardColorTheme) {
            switch theme {
            case .blue:
                self.keyColor = Color(hue: 0.574, saturation: 0.682, brightness: 1.0)
                self.charColor = .white
            }
        }
        
        enum keyboardColorTheme {
            case blue, red, green, orange, white, black // can pair this with a @published var or another class with an init
        }
    }
    
}

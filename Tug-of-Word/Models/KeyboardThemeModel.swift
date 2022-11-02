//
//  KeyboardThemeModel.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/27/22.
//

import SwiftUI

class KeyboardTheme: ObservableObject {
    
    let keyColor: Color
    let charColor: Color

    init(theme: KeyboardColorTheme) {
        switch theme {
        case .blue:
            self.keyColor = Color(hue: 0.574, saturation: 0.682, brightness: 1.0)
            self.charColor = .white
        case .red:
            self.keyColor = .red
            self.charColor = .white
        case .green:
            self.keyColor = .green
            self.charColor = .white
        case .orange:
            self.keyColor = .orange
            self.charColor = .black
        case .white:
            self.keyColor = .white
            self.charColor = .black
        case .black:
            self.keyColor = .black
            self.charColor = .white
        default:
            self.keyColor = .white
            self.charColor = .black
        }
    }

    enum KeyboardColorTheme: CaseIterable {
        case blue, red, green, orange, white, black
        
        var description: String {
            switch self {
            case .blue: return "Blue"
            case .red: return "Red"
            case .green: return "Green"
            case .orange: return "Orange"
            case .white: return "White"
            case .black: return "Black"
            }
        }
    }
    
}

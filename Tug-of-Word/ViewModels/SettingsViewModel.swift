//
//  SettingsViewModel.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/31/22.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    
    static let shared = SettingsViewModel()
    @Published var keyboardTheme: KeyboardTheme.KeyboardColorTheme = .blue
    
}

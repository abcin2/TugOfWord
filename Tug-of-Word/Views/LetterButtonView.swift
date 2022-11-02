//
//  LetterButtonView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/25/22.
//

import SwiftUI

struct LetterButtonView: View {
    @EnvironmentObject var gameViewModelData: GameViewModel
    @EnvironmentObject var settingsViewModelData: SettingsViewModel
    var letter: String
    
    var body: some View {
        Button {
            gameViewModelData.enterLetter(letter)
        } label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(KeyboardTheme(theme: settingsViewModelData.keyboardTheme).keyColor)
                .foregroundColor(KeyboardTheme(theme: settingsViewModelData.keyboardTheme).charColor)
        }
        .cornerRadius(10)
    }
}

struct LetterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonView(letter: "P")
    }
}

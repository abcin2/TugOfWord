//
//  TimedGameSettingsView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 11/5/22.
//

import SwiftUI

struct TimedGameSettingsView: View {
    @ObservedObject var viewModel: TimedGameSetingsViewModel = TimedGameSetingsViewModel()
    var body: some View {
        VStack {
            TextField("", text: $viewModel.gameTime)
            Button("Use Defaults") {
                print("sets everything back to default")
            }
            Button("Play!") {
                print("print")
            }
            //MARK: what I need for game settings
            ///1. time for game
            ///2. number of letters
            ///3.difficulty? -> would need to explain each difficulty level
        }
        .navigationTitle("Game Settings")
    }
}

struct TimedGameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        TimedGameSettingsView()
    }
}

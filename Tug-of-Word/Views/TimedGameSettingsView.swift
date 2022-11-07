//
//  TimedGameSettingsView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 11/5/22.
//

import SwiftUI

struct TimedGameSettingsView: View {
    @StateObject private var viewModel = TimedGameSettingsViewModel()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Game Time")
                Spacer()
                TextField("", text: $viewModel.gameMinutesAsString)
                    .keyboardType(.numberPad)
                    .frame(width: 50.0)
                    .textFieldStyle(.roundedBorder)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                Text(":")
                TextField("", text: $viewModel.gameSecondsAsString)
                    .keyboardType(.numberPad)
                    .frame(width: 50.0)
                    .textFieldStyle(.roundedBorder)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Number of Letters")
                Spacer()
                TextField("", text: $viewModel.wordLength)
                    .keyboardType(.numberPad)
                    .frame(width: 25.0)
                    .textFieldStyle(.roundedBorder)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Button("Use Defaults") {
                viewModel.useDefaults()
            }
            Button("Play!") {
                print("print")
                // will navigate to game view and pass all settings info to it
            }
            //MARK: what I need for game settings
            ///1. time for game
            ///2. number of letters
            ///3.difficulty? -> would need to explain each difficulty level
        }
        .navigationTitle("Game Settings")
        .environmentObject(viewModel)
    }
}

struct TimedGameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        TimedGameSettingsView()
    }
}

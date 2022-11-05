//
//  AllGamesView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/5/22.
//

import SwiftUI

struct AllGamesView: View {
    var body: some View {
        VStack {
            Text("All Games")
            List {
                NavigationLink(destination: TestGameView(data: GameViewModel())) {
                    Text("Test Game")
                }
                NavigationLink(destination: TimedGameSettingsView()) {
                    Text("Timed")
                }
                NavigationLink(destination: TestGameView(data: GameViewModel())) {
                    Text("Infinte")
                }
                NavigationLink(destination: TestGameView(data: GameViewModel())) {
                    Text("Battle")
                }.disabled(true)
            }
        }
    }
}

struct AllGamesView_Previews: PreviewProvider {
    static var previews: some View {
        AllGamesView()
    }
}

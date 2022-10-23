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
                NavigationLink(destination: TestGameView(data: TestGameData())) {
                    Text("Test Game")
                }
                Text("Timed")
                Text("Infinite")
                Text("Battle")
            }
        }
    }
}

struct AllGamesView_Previews: PreviewProvider {
    static var previews: some View {
        AllGamesView()
    }
}

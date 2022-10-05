//
//  StartScreen.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 9/11/22.
//

import SwiftUI

struct StartScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Tug-of-Word").padding()
                Spacer()
                VStack {
                    NavigationLink(destination: NewGameView()) {
                        Text("Play").frame(maxWidth: .infinity).padding(.all, 10.0)
                    }.buttonStyle(.borderedProminent)
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings").frame(maxWidth: .infinity).padding(.all, 10.0)
                    }.buttonStyle(.borderedProminent)
                }.padding()
            }.padding()
        }.navigationTitle("Games")
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}

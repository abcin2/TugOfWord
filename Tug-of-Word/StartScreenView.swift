//
//  StartScreenView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 9/11/22.
//

import SwiftUI

struct StartScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Tug-of-Word").font(.title).padding()
                Text("Beta Version 1.0.0")
                Spacer()
                VStack {
                    NavigationLink(destination: AllGamesView()) {
                        Text("Play").frame(maxWidth: .infinity).padding(.all, 10.0)
                    }.buttonStyle(.borderedProminent)
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings").frame(maxWidth: .infinity).padding(.all, 10.0)
                    }.buttonStyle(.borderedProminent)
                }.padding()
                Spacer()
            }.padding()
        }
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}

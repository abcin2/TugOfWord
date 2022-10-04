//
//  StartScreen.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 9/11/22.
//

import SwiftUI

struct StartScreen: View {
    var body: some View {
        VStack {
            Text("Tug-of-Word").padding()
            Spacer()
            VStack {
                Button(
                    action: {
                        print("Play")
                    },
                    label: {
                        Text("Play").frame(maxWidth: .infinity).padding(.all, 10.0)
                    }
                ).buttonStyle(.borderedProminent)
                Button(
                    action: {
                        print("Settings")
                    },
                    label: {
                        Text("Settings").frame(maxWidth: .infinity).padding(.all, 10.0)
                    }
                ).buttonStyle(.borderedProminent)
            }.padding()
        }.padding()
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}

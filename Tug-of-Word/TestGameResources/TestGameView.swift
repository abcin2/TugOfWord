//
//  TestGameView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/5/22.
//

import SwiftUI

struct TestGameView: View {
    var body: some View {
        VStack {
            Text("Test Game").font(.title)
            Text("3 letter words").font(.subheadline)
            Spacer()
        }
    }
}

struct TestGameView_Previews: PreviewProvider {
    static var previews: some View {
        TestGameView()
    }
}

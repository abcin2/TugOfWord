//
//  LetterButtonView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/25/22.
//

import SwiftUI

struct LetterButtonView: View {
    @ObservedObject var data = TestGameViewModel()
    var letter: String
    var isTapped: Bool
    
    var body: some View {
        Button {
            data.enterLetter()
        } label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(isTapped ? Color(hue: 0.574, saturation: 1, brightness: 1.0) : Color(hue: 0.574, saturation: 0.682, brightness: 1.0))
                .foregroundColor(.primary)
        }
        .cornerRadius(10)
    }
}

struct LetterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonView(letter: "P", isTapped: false)
    }
}

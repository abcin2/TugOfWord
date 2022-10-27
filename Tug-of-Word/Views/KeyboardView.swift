//
//  KeyboardView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/25/22.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var data: GameViewModel
    @EnvironmentObject var keyboardTheme: 
    @State var isTapped: Bool = false // might not need
    var firstRowKeys: [String] = "QWERTYUIOP".map{ String($0) }
    var secondRowKeys: [String] = "ASDFGHJKL".map{ String($0) }
    var thirdRowKeys: [String] = "ZXCVBNM".map{ String($0) }
    
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(firstRowKeys, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                ForEach(secondRowKeys, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                Spacer()
                ForEach(thirdRowKeys, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                Button {
                    data.removeLetter()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 40, height: 50)
                        .background(KeyboardTheme.blue.keyColor)
                        .foregroundColor(KeyboardTheme.blue.charColor)
                }
                .cornerRadius(10)
                .padding(.leading, 10)
                Spacer()
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
            .scaleEffect(Global.keyboardScale)
    }
}

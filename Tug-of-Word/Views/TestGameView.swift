//
//  TestGameView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/5/22.
//

import SwiftUI

struct TestGameView: View {
    @StateObject var data: GameViewModel = GameViewModel()
    @FocusState var textFieldInFocus: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                Text("Test Game").font(.title)
                Spacer()
                Text("Timer")
                    .padding()
            }
            HStack {
                Spacer()
                Spacer()
                Text("3 letter words").font(.subheadline)
                Spacer()
                Text("\(data.timeRemaining)")
                    .font(.subheadline)
                Spacer()
            }
            Spacer()
            Text(data.wordsInCurrentGame[data.counter].word)
                .font(.title)
            Text(data.wordsInCurrentGame[data.counter].clue)
                .font(.subheadline)
                .padding()
            HStack {
                Spacer()
                TextField("", text: $data.guessedWord)
                    .frame(width: 250.0)
                    .textFieldStyle(.roundedBorder)
                    .textCase(.uppercase)
                    .onChange(of: data.guessedWord) { newValue in
                        data.nextWord()
                    }
                    .focused($textFieldInFocus)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            self.textFieldInFocus = true
                        }
                    }
                    .autocorrectionDisabled(true)
                    .autocapitalization(.allCharacters)
                    .disabled(true)
                Spacer()
            }
            Button("Reset") {
                // probably would do some good to add another alert here
                data.reset()
            }
            Spacer()
            Spacer()
            KeyboardView()
                .scaleEffect(Global.keyboardScale)
                .padding(.bottom, 40)
        }
        .alert("Congratulations! You have completed the level!", isPresented: $data.showAlert) {
            Button("OK", role: .cancel) {}
        }
        .onReceive(data.timer) { time in
            data.startTimer()
        }
        .environmentObject(data)
    }
}

struct TestGameView_Previews: PreviewProvider {
    static var previews: some View {
        TestGameView(data: GameViewModel())
    }
}

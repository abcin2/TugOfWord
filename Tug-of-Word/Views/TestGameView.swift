//
//  TestGameView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/5/22.
//

import SwiftUI

struct TestGameView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var data: GameViewModel = GameViewModel()
    @FocusState var textFieldInFocus: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button("End Game") {
                        data.endGame()
                    }
                    .alert("Are you sure you would like to end this game?", isPresented: $data.showEndGameAlert) {
                        Button("NO", role: .cancel) {
                            data.endDeny()
                        }
                        Button("YES", role: .destructive) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 75, alignment: .topLeading)
                VStack {
                    Text("Test Game").font(.title)
                    Text("3 letter words").font(.subheadline)
                }
                .frame(minWidth: 200, alignment: .center)
                VStack {
                    Text("Timer")
                    Text("\(data.timeRemaining)")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, maxHeight: 75, alignment: .topTrailing)
            }
            .padding()
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
                    .multilineTextAlignment(.center)
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
            .padding(.bottom)
            Button("Reset") {
                data.reset()
            }
            .alert("Are you sure you would like to restart this game?", isPresented: $data.showResetAlert) {
                Button("NO", role: .cancel) {
                    data.resetDeny()
                }
                Button("YES", role: .destructive) {
                    data.resetConfirm()
                }
            }
            Spacer()
            Spacer()
            KeyboardView()
                .scaleEffect(Global.keyboardScale)
                .padding(.bottom, 40)
        }
        .alert("Congratulations! You have completed the level!", isPresented: $data.showWinAlert) {
            Button("OK", role: .cancel) {}
        }
        .alert("Oh no! You didn't complete the level in time. Restart?", isPresented: $data.showLoseAlert) {
            Button("OK", role: .destructive) {
                data.resetConfirm()
            }
            Button("Keep playing", role: .cancel) {
                data.sandboxPlay()
            }
        }
        .onReceive(data.timer) { time in
            data.startTimer()
        }
        .environmentObject(data)
        .navigationBarBackButtonHidden()
    }
}

struct TestGameView_Previews: PreviewProvider {
    static var previews: some View {
        TestGameView()
    }
}

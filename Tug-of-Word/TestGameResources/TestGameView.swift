//
//  TestGameView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/5/22.
//

import SwiftUI

class TestGameViewModel: ObservableObject {
    
    struct WordsInGame: Identifiable {
        let word: String
        let clue: String
        let indexChange: Int
        var id: String { word }
    }
    
    public let wordsInCurrentGame: [WordsInGame] = [
        WordsInGame(word: "CAT", clue: "you hit a ball with this", indexChange: 0),
        WordsInGame(word: "BAT", clue: "yes, ___", indexChange: 1),
        WordsInGame(word: "BUT", clue: "the wheels on this go round and round", indexChange: 2),
        WordsInGame(word: "BUS", clue: "bottom or rear", indexChange: 2),
        WordsInGame(word: "BUM", clue: "chew on this sugary treat", indexChange: 2),
        WordsInGame(word: "GUM", clue: "the total", indexChange: 0),
        WordsInGame(word: "SUM", clue: "Congratulations! You win!", indexChange: -1),
    ]
    
    @Published var counter: Int = 0
    
    @Published var guessedWord: String = ""
    
    @Published var showAlert: Bool = false
    
    @Published var timerStopped: Bool = false
    
    func nextWord() {
        
        if counter < wordsInCurrentGame.count - 1 {
            if guessedWord.count == wordsInCurrentGame[counter].word.count {
                if guessedWord.uppercased() == wordsInCurrentGame[counter + 1].word.uppercased() {
                    print("correct word")
                    counter += 1
                    guessedWord = ""
                } else {
                    print("incorrect word")
                }
            } else {
                print("incorrect word")
            }
        } else {
            print("end of game")
            guessedWord = ""
            showAlert = true
            timerStopped = true
            // need to find a way to stop the timer when the game is over
        }
    }
    
    func startTimer() {
        if timeRemaining > 0 && timerStopped == false {
            timeRemaining -= 1
        }
    }
    
    @Published var timeRemaining = 30
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // for keyboard
    
    func enterLetter() {
        return
    }
    
    func removeLetter() {
        return
    }

}

struct TestGameView: View {
    @ObservedObject var data: TestGameViewModel
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
                // eventually will change the above to a custom keyboard - somehow
                Spacer()
            }
            Button("Reset") {
                // probably would do some good to add another alert here
                data.counter = 0
                data.showAlert = false
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .alert("Congratulations! You have completed the level! You have been awarded \(data.timeRemaining * 5) points!", isPresented: $data.showAlert) {
            Button("OK", role: .cancel) {}
        }
        .onReceive(data.timer) { time in
            data.startTimer()
        }
    }
}

//struct TestGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestGameView(data: TestGameData())
//    }
//}

//
//  GameViewModel.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/25/22.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
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
    
    @Published var showWinAlert: Bool = false
    
    @Published var showResetAlert: Bool = false
    
    @Published var showLoseAlert: Bool = false
    
    @Published var timerStopped: Bool = false
    
    @Published var timeRemaining = 30
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Published var sandboxMode: Bool = false
    
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
            showWinAlert = true
            timerStopped = true
        }
    }
    
    func startTimer() {
        if timeRemaining > 0 && timerStopped == false {
            timeRemaining -= 1
        } else if sandboxMode == true {
            timerStopped = true
        } else if timeRemaining == 0 {
            showLoseAlert = true
            timerStopped = true
        }
    }
    
    func sandboxPlay() {
        showLoseAlert = false
        sandboxMode = true // this doesn't change anything atm, but it could eventually be used to display different winning screen
        // currently it only has use for the timer
    }
    
    func reset() {
        showWinAlert = false
        showResetAlert = true
        timerStopped = true
    }
    
    func resetConfirm() {
        showResetAlert = false
        counter = 0
        timeRemaining = 30
        guessedWord = ""
        timerStopped = false
        sandboxMode = false
    }
    
    func resetDeny() {
        showResetAlert = false
        timerStopped = false
    }
    
    // for keyboard
    
    func enterLetter(_ letter: String) {
        guessedWord += letter
        print(guessedWord)
    }
    
    func removeLetter() {
        if guessedWord.count > 0 {
            guessedWord.removeLast()
            print(guessedWord)
        }
    }

}

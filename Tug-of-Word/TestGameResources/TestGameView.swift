//
//  TestGameView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/5/22.
//

import SwiftUI

class TestGameData: ObservableObject {
    
    //let allWords: [String] = Array(wordsInCurrentGame.keys)
    
    @Published var wordsInCurrentGame = [
        "CAT": 0,
        "BAT": 1,
        "BUT": 2,
        "BUS": 2,
        "BUM": 2,
        "GUM": 0,
        "SUM": -1,
    ]
    
    @Published var counter: Int = 0
    
    func nextWord() {
        if counter < wordsInCurrentGame.count - 1 {
            counter += 1
        } else {
            counter = 0
        }
    }
    
//    init(allWords: [String]) {
//        self.allWords = Array(wordsInCurrentGame.keys)
//    }

    
}

struct TestGameView: View {
    @ObservedObject var data: TestGameData
    let allWords: [String] = Array(data.wordsInCurrentGame.keys)
    
    var body: some View {
        VStack {
            Text("Test Game").font(.title)
            Text("3 letter words").font(.subheadline)
            Spacer()
            Text(data.allWords[data.counter])
            Button(action: {data.nextWord()}) {
                Text("Next Word")
            }
        }
    }
}

//struct TestGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestGameView(data: TestGameData())
//    }
//}

//
//  Global.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/25/22.
//

import UIKit

enum Global {
    
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static var minDimension: CGFloat {
        min(screenWidth, screenHeight)
    }
    
    static var keyboardScale: CGFloat {
        switch minDimension {
        case 0...430:
            return screenWidth / 390
        case 431...1000:
            return CGFloat(1.2)
        default:
            return CGFloat(1.6)
        }
    }
    
}

//
//  Global.swift
//  Numble
//
//  Created by Srashta Maharjan on 4/30/22.
//

import UIKit

let sf = 1.0

class Global {
    static var screenwidth:CGFloat {
        UIScreen.main.bounds.size.width
    }
    static var screenHeight: CGFloat{
        UIScreen.main.bounds.size.height
    }
    static var minDimension: CGFloat{
        min(screenwidth, screenHeight)
    }
    
    static var sf: CGFloat {
        switch minDimension {
        case 0...320:
            return 0.8
        case 321...430:
            return 1
        case 431...1000:
            return 1.5
        default:
            return 1
        }
    }
    static var tileSize:CGFloat = 58.0 * sf
    static var colSpacing: CGFloat = 8.0 * sf
    static var rowSpacing: CGFloat = 10.0 * sf
    static var tinySpacing: CGFloat { return CGFloat(colSpacing * 2/3) }
    static var scoreTileSize: CGFloat { return CGFloat((tileSize - tinySpacing)/2)}
    static var lineWidth = 2.0
    static var cornerRadius = 5.0
    static var keyboardWidth = 40.0 * sf
    
    
    
    
    //MARK: Game Variables
    static var level: Int = 4
    static var allowedTries: Int = 10
}

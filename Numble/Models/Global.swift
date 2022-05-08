//
//  Global.swift
//  Numble
//
//  Created by Srashta Maharjan on 4/30/22.
//

import UIKit

class Global {
    static var tileSize:CGFloat = 58.0
    static var colSpacing: CGFloat = 8.0
    static var rowSpacing: CGFloat = 10.0
    static var tinySpacing: CGFloat { return CGFloat(colSpacing * 2/3) }
    static var scoreTileSize: CGFloat { return CGFloat((tileSize - tinySpacing)/2)}
    static var lineWidth = 2.0
    static var cornerRadius = 5.0
    
    //MARK: Game Variables
    static var level: Int = 4
    static var allowedTries: Int = 10
}

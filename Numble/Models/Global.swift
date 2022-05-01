//
//  Global.swift
//  Numble
//
//  Created by Srashta Maharjan on 4/30/22.
//

import UIKit

class Global {
    static var tileSize:CGFloat = 60.0
    static var colSpacing: CGFloat = 8.0
    static var tinySpacing: CGFloat { return CGFloat(colSpacing * 2/3) }
    static var scoreTileSize: CGFloat { return CGFloat((tileSize - tinySpacing)/2)}
}

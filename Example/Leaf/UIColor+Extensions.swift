//
//  UIColor+Extensions.swift
//  Leaf
//
//  Created by Dylan Straughan on 12/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        func randomInt() -> CGFloat {
            return CGFloat(arc4random()) / CGFloat(UInt32.max)
        }
        return UIColor(red: randomInt(),
                       green: randomInt(),
                       blue: randomInt(),
                       alpha: 1)
    }
}

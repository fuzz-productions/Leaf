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
            return CGFloat(arc4random_uniform(255)) / CGFloat(UInt32(255))
        }
        return UIColor(red: randomInt(),
                       green: randomInt(),
                       blue: randomInt(),
                       alpha: 1)
    }
}

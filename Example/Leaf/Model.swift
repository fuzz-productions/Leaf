//
//  Color.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/9/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

enum Leafyness: String {
    case realLeafy = "🍃🍂🍁"
    case notLeafy = "🌵"
    case semiLeafy = "☘"
    case pickupTruck = "🚚"
}

struct Model {
    
    var int: Int?
    var color: UIColor?
    var leafyValue: Leafyness {
        let value = arc4random_uniform(3)
        switch value {
        case 0:
            return .realLeafy
        case 1:
            return .notLeafy
        case 2:
            return .semiLeafy
        default:
            return .pickupTruck
        }
    }
}

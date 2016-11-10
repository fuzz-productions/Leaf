//
//  Datasource.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/9/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

struct Datastore {
    
    static let sharedDatastore = Datastore()
    var models: [Model] = []
    
    mutating func loadData() {
        var cpy: [Model] = []
        for int in 0...150 {
            let model = Model(int: int, color: UIColor(hue: CGFloat(int/150), saturation: 1, brightness: 1, alpha: 1))
            cpy.append(model)
        }
        models = cpy
    }
    
    func request(at offset: Int, limit: Int, onComplete: (([Model]) -> (Void))) {
        var endLimit: Int {
            if models.count < offset + limit {
                return offset + limit - 1
            } else {
                return models.count - 1
            }
        }
        let returnArray = Array(models[offset...endLimit])
        onComplete(returnArray)
    }
}

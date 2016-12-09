//
//  Datasource.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/9/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

final class Datastore {
    
    static let sharedDatastore = Datastore()
    var models: [Model] = []
    
    func loadData() {
        var cpy: [Model] = []
        for int in 0...150 {
            var model = Model()
            model.int = int 
            cpy.append(model)
        }
        models = cpy
    }
    
    func request(at offset: Int, limit: Int, onComplete: (([Model]) -> (Void))) {
        if !models.isEmpty {
            var endLimit = 0
                if models.count > offset + limit {
                    endLimit = offset + limit - 1
                } else {
                    endLimit = models.count - 1
                }
            let returnArray = Array(models[offset...endLimit])
            onComplete(returnArray)
        } else {
           onComplete([])
        }
    }
}

//
//  Array+Extension.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

public extension Array {
    
    /// Groups an array by a property on array's Element
    func groupedBySection<T: Hashable>(
        groupBy: (Element) -> (T)) -> [Int: [Element]] {
        
        var mappedItems = [Int: [Element]]()
        
        var index = -1
        var mapped = [T: Int]()
        
        for item in self {
            let groupingValue = groupBy(item)
            
            if let i = mapped[groupingValue] {
                // Grouped value has been mapped. Add this item to the corresponding section .
                var cpy = mappedItems[i]
                cpy?.append(item)
                mappedItems[i] = cpy
            } else {
                // An item with a new grouping value.
                // Increment section index, add it to the new section, then mark the grouping value as mapped.
                index += 1
                mappedItems[index] = [item]
                mapped[groupingValue] = index
            }
        }
        
        return mappedItems
    }
    
    func asSingleSection() -> [Int: [Element]] {
        return [0: self]
    }
}
	

//
//  CollectionViewCell.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/9/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var intLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: Model) {
        intLabel.text = model.int != nil ? "\(model.int!)" : ""
        contentView.backgroundColor = model.color
    }
}

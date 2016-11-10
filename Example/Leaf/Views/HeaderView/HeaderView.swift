//
//  HeaderView.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/9/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet weak var leafyLabel: UILabel!
    @IBOutlet var contentView: UIView!
    
     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customInit()
    }
    
    func customInit() {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.bounds = frame
        translatesAutoresizingMaskIntoConstraints = false
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func configure(with leafyness: Leafyness) {
        leafyLabel.text = leafyness.rawValue
    }
    
}

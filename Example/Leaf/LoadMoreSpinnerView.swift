//
//  LoadMoreSpinnerView.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class LoadMoreSpinnerView: UIView {
    
    lazy var spinner: UIActivityIndicatorView  = {
        let tmpAct = UIActivityIndicatorView()
        tmpAct.activityIndicatorViewStyle = .gray
        return tmpAct
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        alpha = 0
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: spinner, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: spinner, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        alpha = 0
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: spinner, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: spinner, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    func startSpinning() {
        
        spinner.startAnimating()
        UIView.animate(withDuration: 0.05, animations: {
            self.alpha = 1.0
        })
    }
    
    func stopSpinning() {
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.alpha = 0
        }) { complete in
            if complete {
                self.spinner.stopAnimating()
            }
        }
    }
}


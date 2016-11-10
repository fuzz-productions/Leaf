//
//  ViewController.swift
//  Leaf
//
//  Created by dstraughan on 11/04/2016.
//  Copyright (c) 2016 dstraughan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var datastore = Datastore.sharedDatastore
        datastore.loadData()
        
    }


}


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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "CollectionViewWithSectionsSegue":
            guard let vc = segue.destination as? CollectionViewController else { break }
            vc.sectionType = .sections
        case "CollectionViewSegue":
            guard let vc = segue.destination as? CollectionViewController else { break }
            vc.sectionType = .none
        case "TableViewSegue":
            guard let vc = segue.destination as? TableViewController else { break }
            vc.sectionType = .sections
        case "TableViewWithSectionsSegue":
            guard let vc = segue.destination as? TableViewController else { break }
            vc.sectionType = .sections
        default:
            break
        }
        
        var vc = segue.destination
        
    }
}



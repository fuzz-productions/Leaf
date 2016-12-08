//
//  CollectionViewController.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/9/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Leaf

enum SectionType {
    case none
    case sections
}

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, PagingCollectionViewDelegate, PagingDataSource, PagingView {
    
    var data: [Model] = [] {
        didSet {
            switch sectionType {
            case .sections:
                cellMap = data.groupedBySection(groupBy: { (element) -> (String) in
                    return element.leafyValue.rawValue
                })
            default:
                cellMap = data.asSingleSection()
            }
            append(data: data, to: oldValue)
        }
    }
    var sectionType: SectionType = .none
    var cellMap = [Int: [Model]]()
    var loadMoreSpinnerView: LoadMoreSpinnerView? = LoadMoreSpinnerView()
    var scrollView: UIScrollView { return collectionView }
    var pager = Pager<CollectionViewController, CollectionViewController, CollectionViewController>()
    var dataStore = Datastore.sharedDatastore
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")

        pager.set(view: self, dataSource: self, delegate: self)
        pager.addLoadMoreSpinnerView()
        
        loadInitialData()
    }
    
    func loadInitialData() {
        dataStore.request(at: 0, limit: Int(pager.pageLimit)) { (data) -> (Void) in
            pager.set(initialData: data)
        }
    }
    
    func makeRequestForResults(at offset: UInt, withLimit limit: UInt, onComplete: @escaping (([Model]?) -> Void)) {
        dataStore.request(at: Int(offset), limit: Int(pager.pageLimit)) { (data) -> (Void) in
            onComplete(data)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch sectionType {
        case .sections:
            return cellMap.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellMap[section]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell,
              let model = cellMap[indexPath.section]?[indexPath.row] else { return UICollectionViewCell() }
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.size.width, height: 23)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.size.width/3, height: 80)
    }
}

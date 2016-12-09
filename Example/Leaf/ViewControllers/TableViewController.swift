//
//  TableViewController.swift
//  Leaf
//
//  Created by Dylan Straughan on 11/9/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Leaf

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PagingTableViewDelegate, PagingDataSource, PagingView {
    
    @IBOutlet weak var tableView: UITableView!
    
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
    var scrollView: UIScrollView { return tableView }
    var pager = Pager<TableViewController, TableViewController, TableViewController>()
    var dataStore = Datastore.sharedDatastore
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        pager.set(view: self, dataSource: self, delegate: self)
        pager.addLoadMoreSpinnerView()
        
        loadInitialData()
        
    }
    
    func loadInitialData() {
        dataStore.request(at: 0, limit: Int(pager.pageLimit)) { (data) -> (Void) in
            print(data[0])
            self.pager.set(initialData: data)
        }
    }
    
    func makeRequestForResults(at offset: UInt, withLimit limit: UInt, onComplete: @escaping (([Model]?) -> Void)) {
        dataStore.request(at: Int(offset), limit: Int(pager.pageLimit)) { (data) -> (Void) in
            onComplete(data)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return cellMap.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellMap[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell,
            let model = cellMap[indexPath.section]?[indexPath.row] else { return UITableViewCell() }
        cell.configure(with: model)
        return cell
    }
}

//
//  ViewController.swift
//  DequeueableCell
//
//  Created by Yoshiki Higashi on 2019/08/20.
//  Copyright © 2019 gigashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView! { didSet {
        tableView.dataSource = self
    }}

    let tableData = (1...100).map{(title: "Title - \($0)", detail: "detail - \($0)")}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyCell.dequeueOrCreateReusableCell(withIdentifier: "cell", tableView: tableView) { createdCell in
            createdCell.backgroundColor = .red
        }
        
        cell.textLabel?.text       = tableData[indexPath.row].title
        cell.detailTextLabel?.text = tableData[indexPath.row].detail
        
        return cell
    }
}

final class MyCell: UITableViewCell, DequeueableCell {
    static func create(withIdentifier: String) -> MyCell {
        return MyCell(style: .subtitle, reuseIdentifier: withIdentifier)
    }
}

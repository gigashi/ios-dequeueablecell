//
//  DequeueableCell.swift
//  DequeueableCell
//
//  Created by Yoshiki Higashi on 2019/08/20.
//  Copyright © 2019 gigashi. All rights reserved.
//

import UIKit

public protocol DequeueableCell: UITableViewCell {
    static func dequeueOrCreateReusableCell(withIdentifier: String, tableView: UITableView, initialize: (Self)->()) -> Self
    static func create(withIdentifier: String) -> Self
}

public extension DequeueableCell {
    static func dequeueOrCreateReusableCell(withIdentifier: String, tableView: UITableView, initialize: (Self)->() = {_ in }) -> Self {
        let cell = tableView.dequeueReusableCell(withIdentifier: withIdentifier) as? Self
            ?? self.create(withIdentifier: withIdentifier)
        
        initialize(cell)
        
        return cell
    }
}

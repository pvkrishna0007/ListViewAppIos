//
//  StoriesTableTableViewController.swift
//  ListViewApp
//
//  Created by Krishna Vasamsetti on 23/11/19.
//  Copyright © 2019 Krishna Vasamsetti. All rights reserved.
//

import UIKit

class StoriesTableTableViewController: UITableViewController {

    struct HeadLine {
        var name : String
        var items = [String]()
    }
    
    var headlines = [
        HeadLine(name:"Fruits", items: ["Apple", "Orange", "Mango"]),
        HeadLine(name:"Colors", items: ["Red", "Yellow", "Pink", "Cyan"])
    ]
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return headlines.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        let model = headlines[indexPath.section].items[indexPath.row]
        let lbText = "\(model)"
        cell.textLabel?.text = lbText
        cell.detailTextLabel?.text = "mySub"
        cell.imageView?.image = UIImage(named: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(headlines[section].name)"
    }
    
    override func sel
}

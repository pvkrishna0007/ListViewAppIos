//
//  StoriesTableTableViewController.swift
//  ListViewApp
//
//  Created by Krishna Vasamsetti on 23/11/19.
//  Copyright © 2019 Krishna Vasamsetti. All rights reserved.
//

import UIKit

class HeadLineTableViewCell : UITableViewCell{
    @IBOutlet weak var HeadLineTitle: UILabel!
    @IBOutlet weak var HeadLineSubTitle: UILabel!
    @IBOutlet weak var HeadLineImage: UIImageView!
    
}

class StoriesTableTableViewController: UITableViewController {

    struct HeadLine {
        var name : String
        var items = [String]()
    }
    
    var headlines = [
        HeadLine(name:"Fruits", items: ["Apple", "Banana", "Mango","Sapota", "Orange", "Gova"]),
        HeadLine(name:"Colors", items: ["Red", "Yellow", "Pink", "Cyan", "Purple", "Green"])
    ]
    // MARK: - Table view data source

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headlines.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! HeadLineTableViewCell

        let model = headlines[indexPath.section].items[indexPath.row]
        let lbText = "\(model)"
//        cell.textLabel?.text = lbText
//        cell.detailTextLabel?.text = "mySub"
//        cell.imageView?.image = UIImage(named: model)
        cell.HeadLineTitle.text = lbText
        cell.HeadLineSubTitle.text = "MySubtitle"
        cell.HeadLineSubTitle.isHidden = true
        cell.HeadLineImage.image = UIImage(named: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(headlines[section].name)"
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moving = headlines[sourceIndexPath.section].items[sourceIndexPath.row];
        headlines[sourceIndexPath.section].items.remove(at: sourceIndexPath.row)
        headlines[destinationIndexPath.section].items.insert(moving, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if(indexPath.row == 2){
            return false;
        }
        else{
            return true
        }
    }
}

//
//  ViewController.swift
//  ChurchFinder
//
//  Created by mac on 1/6/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ChurchResultController: UITableViewController {

    var churches: Array<Church>!
    
    convenience init(churches: Array<Church>) {
        self.init()
        self.churches = churches
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nearby Churches"
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //remove extra cells in footer
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 1))
        self.tableView.tableFooterView = footer
        
        //remove sticky header
        let dummyViewHeight : CGFloat = 40;
        let dummyView = UIView(frame:CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: dummyViewHeight))
        self.tableView.tableHeaderView = dummyView;
        self.tableView.contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0);
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override  // return the number of cells each section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.churches.count;
    }

    
    // return cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
       
        cell.textLabel?.text = churches[indexPath.row].name
        
        cell.imageView?.layer.cornerRadius = 40
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.backgroundColor = UIColor(white: 0.95, alpha: 1)

        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    


}



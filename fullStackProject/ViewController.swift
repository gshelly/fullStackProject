//
//  ViewController.swift
//  fullStackProject
//
//  Created by shelly.gupta on 6/14/18.
//  Copyright © 2018 shelly.gupta. All rights reserved.
//

import UIKit


class MyViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = "My Table"
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "dataIdentifier")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataIdentifier") as! CustomTableViewCell
        if indexPath.row == 0 {
            
        }
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


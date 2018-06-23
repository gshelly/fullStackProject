//
//  ViewController.swift
//  fullStackProject
//
//  Created by shelly.gupta on 6/14/18.
//  Copyright © 2018 shelly.gupta. All rights reserved.
//

import UIKit
import Alamofire

class MyViewController: UITableViewController {
    
    var titleString: String?
    
    var myActivityIndicator: UIActivityIndicatorView?
    var countryData: CountryInfo?
    
    lazy var refreshCntrl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(fetchCountryData), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Country Data ...")
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    
        fetchCountryData()
    }
    
    func showActivityIndicator() {
        //ActivityIndicator
        myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        myActivityIndicator?.center = view.center
        myActivityIndicator?.color = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        myActivityIndicator?.startAnimating()
        tableView.addSubview(myActivityIndicator!)
    }
    
    private func setupTableView() {
        //register cell
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "dataIdentifier")
        
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshCntrl
        } else {
            tableView.addSubview(refreshCntrl)
        }
    }
    
    
    @objc func fetchCountryData() {
        showActivityIndicator()
        DataManager.getCountryInfo {[weak self] (countryInfo, error) in
            self?.myActivityIndicator?.stopAnimating()
            
            if let countryObject = countryInfo {
                self?.countryData = countryObject
                self?.navigationItem.title = self?.countryData?.title
                self?.tableView.reloadData()
                self?.refreshCntrl.endRefreshing()
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return countryData != nil ? 1 : 0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryData?.rows.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataIdentifier") as! CustomTableViewCell
        
        let defaultImage = UIImage(named: "noImage.jpeg")
        cell.jsonImage.image = defaultImage
        
        if let countryRowObject = countryData?.rows[indexPath.row] {
            cell.titleLabel.text = countryRowObject.title
            cell.descLabel.text = countryRowObject.countryDescription
            
            if let imageURLString = countryRowObject.imageHref {
                downloadImageURL(row: imageURLString) { (image) in
                    if cell.titleLabel.text == countryRowObject.title {
                        cell.jsonImage.image = image
                    }
                    
                }
            }
            
        }

        return cell
    }
    
    func downloadImageURL(row:String, completionHandler:@escaping (UIImage?) -> Void) {
        
        var downloadedImage: UIImage?
        
        guard let imageURL = URL(string: row) else {
            completionHandler(downloadedImage)
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do{
                let imageData = try Data(contentsOf: imageURL)
                
                DispatchQueue.main.async {
                    downloadedImage = UIImage(data: imageData)
                    completionHandler(downloadedImage)
                }
                
            } catch let error {
                print("Failed to load image \(error)")
            }
        }
        
    }  
    
}


//Get Image
//            let task = URLSession.shared.dataTask(with: imageURL){(data, response, error) in
//                guard let _ = response, let imageData = data else {
//                    return
//                }
//                downloadedImage = UIImage(data: imageData) ?? UIImage()
//
//            }
//            task.resume()
//        }

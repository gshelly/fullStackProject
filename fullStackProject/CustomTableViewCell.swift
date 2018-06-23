//
//  CustomTableViewCell.swift
//  fullStackProject
//
//  Created by shelly.gupta on 6/14/18.
//  Copyright © 2018 shelly.gupta. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    var descLabel = UILabel()
    var jsonImage = UIImageView()
    var viewDictionaries = [String:Any]()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.numberOfLines = 0
        
        jsonImage.translatesAutoresizingMaskIntoConstraints = false
        
        viewDictionaries = ["title": titleLabel, "description": descLabel, "image": jsonImage]
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descLabel.text = nil
        jsonImage.image = nil
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(jsonImage)
        //Using VFL
       addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[title]-|", options:  [], metrics: nil, views: viewDictionaries))
       addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[description]-20-[image(50)]-|", options:  .alignAllBottom, metrics: nil, views: viewDictionaries))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[title]-20-[description]-20-[image(50)]-|", options:  [], metrics: nil, views: viewDictionaries))
        
    }

}

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
        titleLabel.text = "Sample item"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        descLabel.text = "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony"
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.numberOfLines = 0
        
        jsonImage.image = UIImage(named: "apple   ")
        jsonImage.translatesAutoresizingMaskIntoConstraints = false
        
        viewDictionaries = ["title": titleLabel, "description": descLabel, "image": jsonImage]
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(jsonImage)
        
       addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[title]-|", options:  [], metrics: nil, views: viewDictionaries))
       addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[description]-|", options:  [], metrics: nil, views: viewDictionaries))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(30)]-|", options:  [], metrics: nil, views: viewDictionaries))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[title]-20-[description]-20-[image(30)]-20-|", options:  [], metrics: nil, views: viewDictionaries))
        
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        titleLabel.preferredMaxLayoutWidth = titleLabel.frame.width
//        descLabel.preferredMaxLayoutWidth = descLabel.frame.width
//    }

}

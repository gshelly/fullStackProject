//
//  CountryRowsDetails.swift
//  fullStackProject
//
//  Created by shelly.gupta on 6/19/18.
//  Copyright © 2018 shelly.gupta. All rights reserved.
//

import UIKit

class CountryRowsDetails: NSObject {
    
    var title: String = ""
    var countryDescription: String?
    var imageHref: String?
    
    public init?(jsonObject:[String:Any]) {
        guard let title = jsonObject["title"] as? String else { return nil }
        self.title = title
        self.countryDescription = jsonObject["description"] as? String
        self.imageHref = jsonObject["imageHref"] as? String
        super.init()
    }
}


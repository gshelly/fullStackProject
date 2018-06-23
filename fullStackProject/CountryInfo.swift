//
//  CountryInfo.swift
//  fullStackProject
//
//  Created by shelly.gupta on 6/18/18.
//  Copyright © 2018 shelly.gupta. All rights reserved.
//

import UIKit

class CountryInfo: NSObject {
    var title: String = ""
    var rows: [CountryRowsDetails] = []
    
    public init(jsonObject: [String:Any]) {
        if let title = jsonObject["title"] as? String, let countryRows = jsonObject["rows"] as? [[String:Any]] {
            self.title = title
            
            for countryRow in countryRows {
                if let countryRowsDetailsObj = CountryRowsDetails(jsonObject: countryRow) {
                    self.rows.append(countryRowsDetailsObj)
                }
            }
        }
        super.init()
    }
}

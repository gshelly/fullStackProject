//
//  DataManager.swift
//  fullStackProject
//
//  Created by shelly.gupta on 6/19/18.
//  Copyright © 2018 shelly.gupta. All rights reserved.
//

import UIKit
import Alamofire

class DataManager {
    
    class func getCountryInfo(completionHandler:@escaping (CountryInfo?,Error?) ->Void)  {
        
        guard let jsonUrl = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else {
            return
        }
    
        Alamofire.request(jsonUrl).responseString { (response) in
            if let error = response.error {
                print("Failed to get response : \(error)")
            } else if let data = response.result.value?.data(using: .utf8){
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
                        let countryInfo = CountryInfo(jsonObject: jsonObject)
                        completionHandler(countryInfo,nil)
                    }
                    
                } catch let error {
                    print("Failed to load :\(error.localizedDescription)")
                    completionHandler(nil,error)
                }
            }
        }
    }
}

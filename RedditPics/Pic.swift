//
//  Pic.swift
//  RedditPics
//
//  Created by Nick on 1/18/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import Foundation

class Pic{
    var title: String!
    var description: String!
    var image: String!
    
    init(picDict: Dictionary<String,AnyObject>){
        if let title = picDict["title"] as? String{
            self.title = title
        }
        
        if let description = picDict["description"] as? String{
            self.description = description
        }
        
        if let image = picDict["url"] as? String{
            self.image = image
        }
    }
}
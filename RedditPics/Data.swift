//
//  Data.swift
//  RedditPics
//
//  Created by Nick on 1/18/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import Foundation

let PicURL = "https://reddit.com/r/pics.json"

class Data {
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.nickcalabs", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
    
    class func getPicsWithSuccess(success: ((picData:NSData) -> Void)){
        loadDataFromURL(NSURL(string: PicURL)!) { (data, error) -> Void in
            if let urlData = data{
                success(picData: urlData)
            }
        }
    }
        
}
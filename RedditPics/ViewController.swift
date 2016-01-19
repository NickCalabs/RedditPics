//
//  ViewController.swift
//  RedditPics
//
//  Created by Nick on 1/15/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let URL_BASE2 = "https://www.reddit.com/r/pics.json"
    
    var pics = [Pic]()
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        downloadData()
        print(pics)
    }
    
    func downloadData(){
        Data.getPicsWithSuccess { (picData) -> Void in
            let json = JSON(data:picData)
            for index in 1...50{
                if let obj = json["data"]["children"][index]["data"].dictionaryObject{
                    let pic = Pic(picDict: obj)
                    self.pics.append(pic)
    //                print("test \(obj)")
                }
            }
            
            
//            if let appArray = json["data"]["children"].array{
//                for appPicDic in appArray{
//                    var picTitle:String? = appPicDic["data"]["title"].string
//                    let pic = Pic()
//                    pic.title = picTitle
//                    self.pics.append(pic)
//                }
//            }
            
            
            
//            for obj in json["data"]["children"].arrayObject!{
////                let pic = Pic(picDict: obj)
//                
//            }
            dispatch_async(dispatch_get_main_queue()) {
                self.collectionView.reloadData()
            }
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.collectionView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PicCell", forIndexPath: indexPath) as? PicCell{
            
            let pic = pics[indexPath.row]
            cell.configureCell(pic)
            
            return cell
        } else {
            return PicCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pics.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(281, 468)
    }


}


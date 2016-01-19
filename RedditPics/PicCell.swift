//
//  PicCell.swift
//  RedditPics
//
//  Created by Nick on 1/15/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class PicCell: UICollectionViewCell {

    @IBOutlet weak var picImg: UIImageView!
    @IBOutlet weak var picLabel: UILabel!
    
    func configureCell(pic:Pic) {
        if let title = pic.title{
            picLabel.text = title
        }
        
        if let path = pic.image{
            let url = NSURL(string: path)!
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
                let data = NSData(contentsOfURL: url)!
                dispatch_async(dispatch_get_main_queue()){
                    let image = UIImage(data: data)
                    self.picImg.image = image
                }
            }
        }
    }
}

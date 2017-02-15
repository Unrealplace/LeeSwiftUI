//
//  LeeCollectionCell.swift
//  LeeUI
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

typealias CollectionClickBlock = (NSIndexPath) ->(Void)

class LeeCollectionCell: UICollectionViewCell {
    
    var imageV:UIImageView?
    var title:UILabel?
    var path:NSIndexPath?
    var imageClickBlock:CollectionClickBlock?
    
    
    override init(frame:CGRect){
    
        super.init(frame: frame)
        
        leeSetUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func leeSetUI() {
    

        imageV = UIImageView.init(frame: CGRect(x:0,y:0,width:100,height:120))
        
        title  = UILabel.init(frame: CGRect(x:0,y:(imageV?.bounds.maxY)!,width:100,height:30))
    
    let tap = UITapGestureRecognizer()
    tap.numberOfTapsRequired = 1
    tap.addTarget(self, action: #selector(self.imageClick(tap:)))

    imageV?.addGestureRecognizer(tap)
    imageV?.isUserInteractionEnabled = true
    
        self.contentView.addSubview(imageV!)
        self.contentView.addSubview(title!)
        
    }
    
    func leeConfig(pa:NSIndexPath) {
         imageV?.image = UIImage.init(named: "屏幕快照 2017-02-14 13.00.59")
         title?.text    = "oliver girlFr"
         path = pa
    }
    
    @objc private func imageClick(tap:UITapGestureRecognizer){
    
        if (self.imageClickBlock != nil) {
            self.imageClickBlock!(path!)
        }
        
    }
    
    
    
    
}

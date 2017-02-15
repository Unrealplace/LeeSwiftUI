//
//  LeeString.swift
//  LeeUI
//
//  Created by mac on 17/2/13.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//


import UIKit

extension NSString{

         
    func leeTextWithFont(font:UIFont,constrainedToSize size :CGSize) -> CGSize {
        
        
        var textSize:CGSize?
        
        if __CGSizeEqualToSize(size, CGSize.zero) {
            
           
            let attributes = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
            
            textSize = self.size(attributes: attributes as! [String : AnyObject])
            
            
        }else{
        
            let attributes = NSDictionary(object:font,forKey:NSFontAttributeName as NSCopying)
            
            let stringRect = self.boundingRect(with: size, options: .usesLineFragmentOrigin , attributes: attributes as? [String : Any] , context: nil);
            
            textSize = stringRect.size
            
        }
        
        return textSize!;
        
    }
    
}

//
//  LeeModel.swift
//  LeeUI
//
//  Created by mac on 17/2/16.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeModel: NSObject,NSCoding{

    var name:String?

    var titleArr:[String]?
    
    
    init(name:String,title:[String]) {
        self.name = name
       self.titleArr  = title
        
    }
    public func encode(with aCoder: NSCoder){
    
        aCoder.encode(self.name, forKey: "L_name")
      
        aCoder.encode(self.titleArr, forKey: "L_title")
        
        
    }
    
    public required init?(coder aDecoder: NSCoder){
    
        name = aDecoder.decodeObject(forKey: "L_name") as? String
         titleArr = aDecoder.decodeObject(forKey: "L_title") as! [String]?
        
    }
    
    
}

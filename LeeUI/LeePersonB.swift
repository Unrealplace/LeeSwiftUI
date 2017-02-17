//
//  LeePersonB.swift
//  LeeUI
//
//  Created by LiYang on 17/2/17.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeePersonB: commonProtol {

    var companyName:String?
    
    //协议中定义的属性
    var pricePerMonth:Double = 400.0
    var duration:Int = 12
    var discount:Double = 0.9
    
    func payment() -> Double {
        let amount = self.pricePerMonth *  self.discount * Double(duration)
        return amount
    }
    
    func cancel() {
        print("与企业客户的租赁协议取消")
    }
}

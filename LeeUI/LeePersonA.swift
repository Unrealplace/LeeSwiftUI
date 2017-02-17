//
//  LeePersonA.swift
//  LeeUI
//
//  Created by LiYang on 17/2/17.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeePersonA: commonProtol {

    var personName:String?
    
    //协议中定义的属性
    var pricePerMonth:Double = 500.0
    var duration:Int = 3
    var discount:Double = 1.0
    
    func payment() -> Double {
        let amount = self.pricePerMonth *  self.discount * Double(duration)
        return amount
    }
    
    func cancel() {
        print("与个人客户的租赁协议取消")
    }
    
}

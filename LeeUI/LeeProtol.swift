//
//  LeeProtol.swift
//  LeeUI
//
//  Created by LiYang on 17/2/17.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import Foundation

protocol commonProtol {
    //协议中定义的属性，必须指定{get}或{get set}
    var pricePerMonth:Double {get}
    var duration:Int {get set}
    var discount:Double {get set}
    
    //协议中定义函数(方法)
    func payment() -> Double //付款
    func cancel() //取消租赁合同
}

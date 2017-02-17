//
//  LeeBlockTestView.swift
//  LeeUI
//
//  Created by mac on 17/2/17.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit


//无参无返回值
typealias funcBlock = () -> () //或者 () -> Void
//返回值是String
typealias funcBlockA = (Int,Int) -> String
//返回值是一个函数指针，入参为String
typealias funcBlockB = (Int,Int) -> (String)->()
//返回值是一个函数指针，入参为String 返回值也是String
typealias funcBlockC = (Int,Int) -> (String)->String



class LeeBlockTestView: UIView {

    var testBtn:UIButton?
    var testLabel:UILabel?
    
    //block作为属性变量
    var blockProperty : (Int,Int) -> String = {a,b in return ""/**/} // 带初始化方式
    var blockPropertyNoReturn : (String) -> () = {param in }
    
    var blockPropertyA : funcBlockA?  //这写法就可以初始时为nil了,因为生命周其中，(理想状态)可能为nil所以用?
    var blockPropertyB : funcBlockB!  //这写法也可以初始时为nil了,因为生命周其中，(理想状态)认为不可能为nil,所以用!
    var blockPropertyC : funcBlockC?
    
    var blockVoid      : funcBlock?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        testBtn = UIButton()
        testBtn?.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 40)
        testBtn?.setTitle("点我改变", for: .normal)
        testBtn?.backgroundColor = UIColor.red
        testBtn?.addTarget(self, action: #selector(LeeBlockTestView.leeBtnClick), for: .touchUpInside)
        
        testLabel = UILabel()
        testLabel?.backgroundColor = UIColor.orange
        testLabel?.frame = CGRect.init(x: 0, y: (testBtn?.bounds.maxY)!, width: self.bounds.width, height: 40)
        
        self.addSubview(testBtn!)
        self.addSubview(testLabel!)
        print("blockPropertyA = \(blockPropertyA) , blockPropertyB = \(blockPropertyB)")
        print("blockProperty = \(blockProperty) , blockPropertyNoReturn = \(blockPropertyNoReturn)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func leeBtnClick(btn:UIButton){
    
        print("我被点击了")
        if (self.blockVoid != nil) {
            self.blockVoid!()
        }
        
    }
    
    func testProperty(tag:Int)
    {
        switch (tag)
        {
        case 1:
            self.blockPropertyNoReturn("OK GOOD")
            break
        case 2:
            if self.blockPropertyA != nil
            {
                let result = self.blockPropertyA!(7,8)
                
                print("result = \(result)")
            }
            break
        case 3:
            if (self.blockPropertyB) != nil
            {
                let fc = self.blockPropertyB(1,2)
                fc("输出")
            }
            break
        case 4:
            if  self.blockPropertyC != nil {
                let fc = self.blockPropertyC!(1,3)
                
                print(fc("oliver"))
                
            }
            break
        default:
            let ret = self.blockProperty(3,4)
            print(ret)
        }
    }
    
    
    
    
    
    //block作为函数参数
    func testBlock(blockfunc:funcBlock!)//使用!号不需要再解包
    {
        if (blockfunc) != nil
        {
            blockfunc() //无参无返回
        }
    }
    
    func testBlockA(blockfunc:funcBlockA!)
    {
        if (blockfunc) != nil
        {
            let retstr = blockfunc(5,6)
            print(retstr)
        }
    }
    
    func testBlockB(blockfunc:funcBlockB!)
    {
        if (blockfunc) != nil
        {
            let retfunc = blockfunc(5,6)
            retfunc("结果是")
        }
    }
    
    func testBlockC(blockfunc:funcBlockC!)
    {
        if (blockfunc) != nil
        {
            let retfunc = blockfunc(5,6)
            let str = retfunc("最终果结是")
            print(str)
        }
    }
    
    

}

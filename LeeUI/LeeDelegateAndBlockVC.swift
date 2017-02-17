//
//  LeeDelegateAndBlockVC.swift
//  LeeUI
//
//  Created by mac on 17/2/17.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeDelegateAndBlockVC: LeeBVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let testView = LeeBlockTestView.init(frame: CGRect.init(x: 100, y: 100, width: 230, height: 180))
        
        self.view.addSubview(testView)
        
        testView.blockVoid = {() ->() in
        
            //block设置前,啥也没有输出
            testView.testProperty(tag: 0)
            testView.testProperty(tag: 1)
            testView.testProperty(tag: 2)
            testView.testProperty(tag: 3)
            testView.testProperty(tag: 4)
            
            print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝设置block属性＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
            
            testView.blockProperty = {
                (a :Int,b:Int) -> String in
                let c = a*100+b
                return "\(a)*100+\(b) = \(c)"
            }
            testView.testProperty(tag: 0)
            
            testView.blockPropertyNoReturn = {
                (param:String) -> () in
                print("input param value is : \(param)")
            }
            testView.testProperty(tag: 1)
            
            testView.blockPropertyA = {
                (a:Int,b:Int) -> String in
                let c = a*100+b*200
                return "\(a)*100+\(b)*200 = \(c)"
            }
            testView.testProperty(tag: 2)
            
            testView.blockPropertyB = {
                (a:Int,b:Int) -> (String)->() in
                func sumprint(result:String)
                {
                    let c = a + b;
                    print("sumprint func print:parame :\(result) \(a) + \(b) = \(c)")
                }
                
                return sumprint
            }
            
            testView.blockPropertyC = {(a:Int,b:Int) ->(String)->(String) in
                
                func testString(str:String) ->(String){
                    
                    return "\(str)" + " lee"
                    
                }
                return testString
            }
            
            
            testView.testProperty(tag: 3)
            testView.testProperty(tag: 4)
            

            
        }
        
        print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝函数block为nil时无输出＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
        testView.testBlock(blockfunc: nil)
        testView.testBlockA(blockfunc: nil)
        testView.testBlockB(blockfunc: nil)
        testView.testBlockC(blockfunc: nil)
        print("＝＝＝＝＝＝＝＝＝＝＝＝＝＝函数block操作＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")
        testView.testBlock(blockfunc: {
            //do something
            print("无参无返回值block 执行")
        })
        
        testView.testBlockA(blockfunc: {
            (a:Int,b:Int) -> String in
            let c = a*400+b*1000
            return "\(a)*400 + \(b)*1000 is \(c)"
        })
        
        testView.testBlockB(blockfunc: {
            (a:Int,b:Int) -> (String)->() in
            func sumprint(result:String)
            {
                let c = a / b;
                print("sumprint func print:parame :\(result) \(a) / \(b) = \(c)")
            }
            
            return sumprint
        })
        
        testView.testBlockC(blockfunc: {
            (a:Int,b:Int) -> (String)->String in
            func sumrsult(res:String) -> String
            {
                let c = a*a+b*a
                return "\(res) \(a)*\(a)+\(b)*\(a) = \(c)"
            }
            return sumrsult
        })
        
        
    }

}

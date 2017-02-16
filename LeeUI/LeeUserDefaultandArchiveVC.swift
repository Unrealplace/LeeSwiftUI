//
//  LeeUserDefaultandArchiveVC.swift
//  LeeUI
//
//  Created by mac on 17/2/16.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeUserDefaultandArchiveVC: LeeBVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        leeUserDefault()
        testModel()
        
     }
    
    
    /// userDefault
    func leeUserDefault() {
        
        let userDefault:UserDefaults = UserDefaults.standard
        
       // print(userDefault.dictionaryRepresentation())
         let imageData:Data = NSKeyedArchiver.archivedData(withRootObject: UIImage.init(named: "屏幕快照 2017-02-14 13.00.59")!)
        
        
        
        userDefault.set(100, forKey: "num")
        
        userDefault.setValue(["oliver","lee"], forKey: "name")
        
        userDefault.setValue(["name":"oliver lee"], forKey: "nameDic")
        

        userDefault.setValue(imageData, forKey: "image")
        
        
        print(userDefault.value(forKey: "nameDic")!)
        print(userDefault.value(forKey: "name")!)
        print(userDefault.value(forKey: "num")!)
        

        let data = userDefault.value(forKeyPath: "image")
        
        
        //解开失败？
        //let imageH:AnyObject = NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! NSData)!
        
        
    }
    
    func testModel(){
    

        
        let model = LeeModel(name:"oliver lee",title:["lee yang","yang lee"])
        
        // 实例对象 转换成 data 类型
        let dataModel:Data = NSKeyedArchiver.archivedData(withRootObject: model)
        
        // 存储对象
        UserDefaults.standard.setValue(dataModel, forKey: "mymodel")
        
        
        
        // 获取对象
        
        let theModel:LeeModel = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.value(forKey: "mymodel") as! Data) as! LeeModel
        
        print(theModel)
        
        
        
        
        
    }
    

    
}

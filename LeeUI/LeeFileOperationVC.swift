//
//  LeeFileOperationVC.swift
//  LeeUI
//
//  Created by mac on 17/2/16.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeFileOperationVC: LeeBVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        
        //获取程序的 home 目录
        let homeDir = NSHomeDirectory()
        print("home:\(homeDir)")
        //1.获取document 路径数组
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        //获取 document 路径
        let documentPath = documentPaths[0]
        
        //获取 document 路径 另一种方式
        let documentPath2 = homeDir + "/Documents"
        print(documentPath)
        print(documentPath2)
        
        
        //library 目录下有俩个子目录：caches 和 preferences
        // caches 目录主要存放缓存文件，itunes 不会备份 此目录，此目录下文件不会在应用退出时删除
        //2.获取library 目录
        let libraryPaths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        //获取library 路径
        let libraryPath = libraryPaths[0]
        
        //获取library 路径的 另一种方式
        let libraryPath2 = homeDir + "/Library"
        
        print(libraryPath)
        print(libraryPath2)
        
        
        
        //3.获取caches 路径
        let cachesPaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachesPath = cachesPaths[0]
        
        //获取 caches 路径的另一种方式
        let cachesPath2 = homeDir + "/Library/Caches"
        
        print(cachesPath)
        print(cachesPath2)
        
        
        //4.获取tmp 路径
        let tmpDir = NSTemporaryDirectory()
        
        //另一种方式 获取
        let tmpDir2 = homeDir + "/tmp"
        
        print(tmpDir)
        print(tmpDir2)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
     }

    
    
}

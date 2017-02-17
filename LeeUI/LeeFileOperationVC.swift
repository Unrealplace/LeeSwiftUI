//
//  LeeFileOperationVC.swift
//  LeeUI
//
//  Created by mac on 17/2/16.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit


// 如果上面直接运行会报错，因为你需要在要归档的对象中遵循NSCoding协议，并实现归档方法和解析方法 如：
class Contact: NSObject, NSCoding {
    
    var name: String?
    var phone: String?
    
    required init(name: String, phone: String){
        self.name = name
        self.phone = phone
    }
    
    
    // 在对象归档的时候调用（哪些属性需要归档，怎么归档）

    public func encode(with aCoder: NSCoder){
        
        aCoder.encode(name, forKey: "name")
        
    }
    // 解析NIB/XIB的时候会调用
    public required init?(coder aDecoder: NSCoder){
        
        name = aDecoder.decodeObject(forKey: "name") as? String

        
    }

}


class LeeFileOperationVC: LeeBVC {

    var error:NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        
        
//        1、应用程序包：包含了所有的资源文件和可执行文件
//        2、Documents：保存应用运行时生成的需要持久化的数据，iTunes同步设备时会备份该目录
//        3、tmp：保存应用运行时所需要的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行，系统也可能会清除该目录下的文件，iTunes不会同步备份该目录
//        4、Library/Cache：保存应用运行时生成的需要持久化的数据，iTunes同步设备时不备份该目录。一般存放体积大、不需要备份的非重要数据
//        5、Library/Preference：保存应用的所有偏好设置，IOS的Settings应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录
        
        leeSave()
        leeFindPath()
        leeCreatFile()
        leeSavePicture()
        leeSaveBaseData()
        leeFileCopyMoveReName()
        leeGetFileAttriutes()
        leeDeleteFile()

    }
    

    func leeFindPath(){
    
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
    
    
    
    
    func leeSave() {
         leeSavePlist()
        leeSaveUserDefault()
        leeSaveArchiver()
    }
    
    
    func leeSavePlist(){
        saveWithFile()
        
        readWithFile()
        
    }
    
    func leeSaveUserDefault(){
    
        saveWithNSUserDefaults()
        readWithNSUserDefaults()
    }
    
    func leeSaveArchiver(){
    
        saveWithNSKeyedArchiver()
        readWithNSKeyedUnarchiver()
        
    }
    
    
   // 1、存储为plist属性列表
    func saveWithFile() {
        // 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString;
        // 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.appendingPathComponent("Documents") as NSString;
        // 3、获取文本文件路径
        let filePath = docPath.appendingPathComponent("data.plist");
        let dataSource = NSMutableArray();
        dataSource.add("衣带渐宽终不悔");
        dataSource.add("为伊消得人憔悴");
        dataSource.add("故国不堪回首明月中");
        dataSource.add("人生若只如初见");
        dataSource.add("暮然回首，那人却在灯火阑珊处");
        // 4、将数据写入文件中
        dataSource.write(toFile: filePath, atomically: true);
    }
    func readWithFile() {
        /// 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString;
        /// 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.appendingPathComponent("Documents") as NSString;
        /// 3、获取文本文件路径
        let filePath = docPath.appendingPathComponent("data.plist");
        let dataSource:NSMutableArray = NSArray(contentsOfFile: filePath) as! NSMutableArray;
        
        print(dataSource)
        
        
    }
    
    
   // 2、使用NSUserDefaults存储数据
    func saveWithNSUserDefaults() {
        // 1、利用NSUserDefaults存储数据
        let defaults = UserDefaults.standard;
        // 2、存储数据
        defaults.set("衣带渐宽终不悔", forKey: "name");
        // 3、同步数据
        defaults.synchronize();
    }
    func readWithNSUserDefaults(){
        let defaults = UserDefaults.standard;
        let name:String = defaults.string(forKey: "name")!
        let aswitch = defaults.bool(forKey: "bool")
        print(name)
        print(aswitch)
    }
    
   // 3、归档存储：对象需要实现NSCoding协议，归档对应encode，反归档对应decode
    /**
     归档数据
     需要实现NSCoding协议
     */
    func saveWithNSKeyedArchiver() {
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let filePath = docPath.appendingPathComponent("contact.data");
        let contact = Contact(name: "123333", phone: "123456")
        /**
         *  数据归档处理
         */
        NSKeyedArchiver.archiveRootObject(contact, toFile: filePath);
    }
       /**
     反归档数据
     */
    func readWithNSKeyedUnarchiver() {
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        
        let filePath = docPath.appendingPathComponent("contact.data");
        let contact = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! Contact;
        print(contact.name!)
    }

    
    
}

// Mark 文件夹下保存数据
extension LeeFileOperationVC {

    
    func leeCreatFile() {
        
        do
        {
            let cachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
            let cachePath = cachePaths[0]
            let leeDir = cachePath + "/leeDir"
            print(leeDir)
            try FileManager.default.createDirectory(atPath: leeDir, withIntermediateDirectories: true, attributes: nil)
            let leeFile = leeDir + "/leeInfo.txt"
            let info = "hello dajia hao come frome jia ldjo anncvoiasho nvdlnvvodn ifdo fjlda lf fjdlfj"
            do{
            
                try info.write(toFile: leeFile, atomically: true, encoding: String.Encoding.utf8)
                
            }
            catch let error as NSError{
            
                print(error)
            }
        }
        catch let error as NSError{
            print(error)
            
        }
        
    }
    
    //保存图片
    func leeSavePicture(){
        
        let cachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachePath = cachePaths[0]
        let leejpg = cachePath + "/leeDir/image.jpg"
        let leepng = cachePath + "/leeDir/png.jpg"
        
        let image:UIImage = UIImage.init(named: "屏幕快照 2017-02-14 13.00.59")!
        
        let jpgData:NSData = UIImageJPEGRepresentation(image, 1.0)! as NSData
        let pngData:NSData = UIImagePNGRepresentation(image)! as NSData
        
        jpgData.write(toFile: leejpg, atomically: true)
        pngData.write(toFile: leepng, atomically: true)
        
        
    }
    
    // 保存基础数据类型 String Nsarray NsDictionary
    func leeSaveBaseData() {
        
        let cachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachePath = cachePaths[0]
        let arrPath = cachePath + "/leeDir/arr.plist"
        let dicPath = cachePath + "/leeDir/dic.plist"
        let stringPath = cachePath + "/leeDir/str.plist"
        
        
        // 数组文件
        let array = NSArray(objects:"lee","yang","oliver")
        
        //字典文件
        let dictionary = NSDictionary(objects:["ghghgkn","wwwwg","hahaha"],forKeys:["1" as NSCopying,"2" as NSCopying,"3" as NSCopying])
        
       //字符串文件
        let string = "oliver lee is the most boy"
        
        
        array.write(toFile: arrPath, atomically: true)
        dictionary.write(toFile: dicPath, atomically: true)
        
        do{
        
            try string.write(toFile: stringPath, atomically: true, encoding: String.Encoding.utf8)

        }
        catch let error as NSError {
        
           print(error)
        }
        
    }
    
    
}

extension LeeFileOperationVC{
    
    // 获取文件创建的信息
    func leeGetFileAttriutes() {
        let cachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachePath = cachePaths[0]
        let leejpg = cachePath + "/leeDir/image.jpg"
        
        do{
        
            let fileAttributes:NSDictionary =  try FileManager.default.attributesOfItem(atPath: leejpg) as NSDictionary
            
            
            print(fileAttributes)
            // 获取创建日期
            let fileDate = fileAttributes[FileAttributeKey.modificationDate]
            // 获取文件大小
            let fileSize = fileAttributes[FileAttributeKey.size]
            
            print("fileDate:\(fileDate) and filsize:\(fileSize)")
            
        }
        catch let error as NSError {
        
            print(error)
            
        }
        
    }
    
    // 遍历删除所有的文件
    func leeDeleteFile() {
        
        let cachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let cachePath = cachePaths[0]
        let leejpg = cachePath + "/leeDir"
        
        let fileArray:[String] = (FileManager.default.subpaths(atPath: leejpg)! as [String])
        
        for fn in fileArray{
        
            do{
            
                print(fn)
                
                try FileManager.default.removeItem(atPath: leejpg + "/\(fn)")
            }
            catch let error as NSError{
            
                print(error)
                
            }
            
        }
        
    }
    
}



extension LeeFileOperationVC {

    
    func leeFileCopyMoveReName() {
        
        // 新的文件地址 目标地址
        let cachePaths = NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true)
        let cachePath = cachePaths[0]
        let leeDir = cachePath + "/leeDir"
        let leeFile = leeDir + "/leeNewFile.txt"
    
        //旧的文件地址
        let qcachePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let qcachePath = qcachePaths[0]
        let qleeDir = qcachePath + "/leeDir"
        let qleeFile = qleeDir + "/leeInfo.txt"
        
        do{
        
            let exist = FileManager.default.fileExists(atPath: leeDir)
            
            if !exist {
                do{
                
                    try  FileManager.default.createDirectory(atPath: leeDir, withIntermediateDirectories: true, attributes: nil)
                    
                    do {
                    
                        //移动当前文件到另一个路径
                        try FileManager.default.moveItem(atPath: qleeFile, toPath: leeFile)
                    }
                    catch let error as NSError{
                    
                        print(error)
                    }
                }
                catch let error as NSError {
                
                   print(error)
                }
               
            }else{
            
                // 重命名文件
                let newNameFile = leeDir + "newLeeInfo.txt"
                
                do{
                    
                    try FileManager.default.moveItem(atPath: qleeFile, toPath: newNameFile)
                    
                }
                catch let error as NSError{
                    
                    print(error)
                }
                // copy 一个文件到某个路径
                let copyPath = leeDir + "leeCopy.txt"
                do{
                    
                    try FileManager.default.copyItem(atPath: leeFile, toPath: copyPath)
                }
                catch let error as NSError{
                    
                    print(error)
                    
                }

                
            }
            
        }
        
    }
    
    
}


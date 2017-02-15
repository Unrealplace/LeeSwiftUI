//
//  LeeUILabelVC.swift
//  LeeUI
//
//  Created by mac on 17/2/13.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit


class LeeUILabelVC: LeeBaseViewController {

    var nameLabel:UILabel!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //创建label
        nameLabel = UILabel()
        
        nameLabel?.frame = CGRect(x:100,y:100,width:200,height:40)
        
        nameLabel?.backgroundColor = UIColor.red
        
        self.view.addSubview(nameLabel!)
        
        //常用的属性和方法
        nameLabel?.tag = 101
        
        nameLabel = self.view.viewWithTag(101) as! UILabel?
        

        
        nameLabel?.text = "hello 大家好，我是来自火星的李杨哦哈哈哈活动链接啊你"
        
        nameLabel?.font = UIFont.systemFont(ofSize: 18)
        
        nameLabel?.textColor = UIColor.yellow;
        
        nameLabel?.shadowColor = UIColor.green
        
        nameLabel?.shadowOffset = CGSize(width:5,height:0)
        
        nameLabel?.textAlignment = .left
        
        nameLabel?.lineBreakMode = .byTruncatingTail
        
        nameLabel?.numberOfLines = 2
        
        
        let textString:NSString = "你懂啊给你拉到你哦工地啊给你拉到你哦工地啊给你拉到你哦工地啊给你拉到你哦工地啊给你拉到你哦工地啊给你拉到你哦工地啊给你拉到你哦工地啊给你拉到你哦工地啊给你拉到你哦工地啊给你拉到你哦工地好惊悚啊火锅见到佛阿森纳观看你不懂伞哦更多大事了浓厚哦是那狗的你啊烧开后放那个困难哦能力还是动感你看你发的还是高";
        
        //限制宽度
        let size1:CGSize = textString.leeTextWithFont(font: UIFont.systemFont(ofSize: 14), constrainedToSize: CGSize(width:200,height:CGFloat(MAXFLOAT)))
        
        print("文本的高度：\(size1.height)")
        
        
        //不限制宽度
        let size2:CGSize = textString.leeTextWithFont(font: UIFont.systemFont(ofSize: 14), constrainedToSize: CGSize.zero);
        
        print("文本区域：\(size2)")
        
        

        
    }

    
    
    
    
}

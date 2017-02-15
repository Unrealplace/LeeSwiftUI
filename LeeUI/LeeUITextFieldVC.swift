//
//  LeeUITextFieldVC.swift
//  LeeUI
//
//  Created by mac on 17/2/14.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeUITextFieldVC: UIViewController,UITextFieldDelegate{

    var leeTextFidld:UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        leeTextFidld = UITextField()
        leeTextFidld?.frame = CGRect(x:100,y:100,width:180,height:50)
        leeTextFidld?.backgroundColor = UIColor.clear
        self.view.addSubview(leeTextFidld!)
        leeTextFidld?.delegate = self
       
        
        
        let attributeStr:NSMutableAttributedString = NSMutableAttributedString(string:"我是漂亮的站位")
        //添加字体大小
        attributeStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 15), range: NSRange(location:0, length:7))
        //添加字体颜色
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSRange(location:0,length:7))
        //设置文字背景颜色
       // attributeStr.addAttribute(NSBackgroundColorAttributeName, value: UIColor.purple, range: NSRange(location:0,length:4))
        
        leeTextFidld?.attributedPlaceholder = attributeStr
        // 文字颜色
        leeTextFidld?.textColor = UIColor.blue
        
        leeTextFidld?.layer.borderWidth = 2.0;
        
        leeTextFidld?.layer.cornerRadius = 10;
        
        leeTextFidld?.layer.masksToBounds = true;
        
        leeTextFidld?.layer.borderColor = UIColor.purple.cgColor
    
        //创建左边视图
        let leftView:UIView = UIView(frame:CGRect(x:0,y:0,width:20,height:20))
        leftView.backgroundColor = UIColor.cyan
        leeTextFidld?.leftView = leftView
        leeTextFidld?.leftViewMode = UITextFieldViewMode.whileEditing
        
        
        leeTextFidld?.becomeFirstResponder()
        
        //注册开始编辑的通知
        NotificationCenter.default.addObserver(self, selector: #selector(LeeUITextFieldVC.leeTextBeginEditing), name: .UITextFieldTextDidBeginEditing, object: nil)
        //注册结束编辑的通知
        NotificationCenter.default.addObserver(self, selector: #selector(LeeUITextFieldVC.leeEndEditing), name: .UITextFieldTextDidEndEditing, object: nil)
        
    
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        leeTextFidld?.resignFirstResponder()
        
    }
    
    func leeTextBeginEditing() {
         print("开始编辑了编辑了")
    }
    
    func leeEndEditing() {
         print("结束编辑了编辑了")
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        NSLog("开始编辑")
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        NSLog("结束编辑")

    }
    

    
    
 
}

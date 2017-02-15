//
//  LeeUIButtunVC.swift
//  LeeUI
//
//  Created by mac on 17/2/14.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeUIButtunVC: UIViewController {

    var nameLabel:UILabel?
    var clickBtn:UIButton?
    var Btn2:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        nameLabel = UILabel(frame:CGRect(x:100,y:100,width:200,height:40))
        
        nameLabel?.backgroundColor = UIColor.red
        
        self.view.addSubview(nameLabel!)
        
        
        clickBtn = UIButton(frame:CGRect(x:0,y:0,width:100,height:100))
        
        clickBtn?.backgroundColor = UIColor.purple
        
        clickBtn?.center = self.view.center
        
        
        // 设置title 和 点击事件
        clickBtn?.setTitle("点我啊", for: UIControlState.normal)
        
        clickBtn?.addTarget(self, action: #selector(LeeUIButtunVC.leeBtnClick(btn:)), for: UIControlEvents.touchUpInside)

        // 图片会遮挡 住标题
        //clickBtn?.setImage(UIImage.init(named: "屏幕快照 2017-02-14 13.00.59"), for: UIControlState.normal)
        clickBtn?.setBackgroundImage(UIImage.init(named: "屏幕快照 2017-02-14 13.00.59"), for: UIControlState.normal)
        clickBtn?.setTitleColor(UIColor.red, for: UIControlState.normal)
        clickBtn?.setTitleColor(UIColor.blue, for: UIControlState.selected)
        
        
        //设置富文本
        
        let btnAttribute:NSMutableAttributedString = NSMutableAttributedString(string:"来啊快活啊")
        btnAttribute.addAttribute(NSForegroundColorAttributeName, value: UIColor.yellow, range: NSRange(location:0,length:5))
        
        clickBtn?.setAttributedTitle(btnAttribute, for: UIControlState.normal)
        
        
        clickBtn?.adjustsImageWhenDisabled = true
        
        
        
        
        
        self.view.addSubview(clickBtn!)
        
        
        
        
        
        
     }

    func leeBtnClick(btn:UIButton){
    
        btn.isSelected = !btn.isSelected
        
        btn.setTitle("讨厌呢", for: UIControlState.selected)
        
    }
    
    
    
   
}

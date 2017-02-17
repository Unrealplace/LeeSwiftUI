//
//  LeeDelegateView.swift
//  LeeUI
//
//  Created by LiYang on 17/2/17.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit


typealias LeeFuncBlock = () ->()


@objc protocol touchViewDelegate{

    @objc func leeChangeColor(color:UIColor) -> String

}

class LeeDelegateView: UIView{
    
    
    var clickBtn:UIButton?
    var delegate:touchViewDelegate?
    var clickBlock:LeeFuncBlock?
    
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        clickBtn = UIButton()
        clickBtn?.frame = CGRect.init(x: 0, y:0 , width: self.bounds.size.width, height: self.bounds.size.height - 40)
        clickBtn?.backgroundColor = UIColor.red
        clickBtn?.addTarget(self, action: #selector(self.btnClick(btn:)), for: .touchUpInside)
        self.addSubview(clickBtn!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnClick(btn:UIButton){
        
        if (self.delegate != nil) {
           btn.setTitle(self.delegate?.leeChangeColor(color: UIColor.orange), for: .normal)
        }
        
    }
    

}

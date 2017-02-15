//
//  LeeTableHeadAndFooterView.swift
//  LeeUI
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

typealias HeadClickBlock = (Int) ->(Void)

class LeeTableHeadAndFooterView: UITableViewHeaderFooterView {

    var clickBtn:UIButton?
    var clickBlock:HeadClickBlock?
    override public  init(reuseIdentifier: String?) {
    
        super.init(reuseIdentifier: reuseIdentifier)
        self.LeeSetUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func LeeSetUI() {
        
        clickBtn = UIButton.init(frame: CGRect(x:0,y:0,width:200,height:50))
        
        clickBtn?.setTitle("click to change", for: .normal)
        
        clickBtn?.backgroundColor = UIColor.red
        
        clickBtn?.addTarget(self, action: #selector(LeeTableHeadAndFooterView.leeBtnClick(btn:)), for: .touchUpInside)
        
        clickBtn?.isUserInteractionEnabled = true
        
        self.contentView.addSubview(clickBtn!)
        
    }
    
    func LeeLayoutUI()  {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
    }
    
    func leeBtnClick(btn:UIButton){
        
        if (self.clickBlock != nil) {
            
            self.clickBlock!(2456)
            
        }else{
        
            print("block is nil")
        }
    }
    
//    override func layoutSubviews() {
//         clickBtn?.addTarget(self, action: #selector(LeeTableHeadAndFooterView.leeBtnClick(btn:)), for: .touchUpInside)
//         clickBtn?.center = CGPoint(x:self.bounds.width / 2.0,y:self.bounds.size.height / 2.0)
//    }
    deinit {
        
        print("header dealloc")
    }
    

}

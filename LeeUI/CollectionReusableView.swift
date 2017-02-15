//
//  CollectionReusableView.swift
//  LeeUI
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

typealias CollectionHeadClickBlock = () ->(Void)

class CollectionReusableView: UICollectionReusableView {
    
    var clickBtn:UIButton?
    var btnClickBlock:CollectionHeadClickBlock?
    
    override init(frame:CGRect){
        
        super.init(frame: frame)
        
        leeSetUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func leeSetUI() {
    
        clickBtn = UIButton.init(type: .custom)
        clickBtn?.frame = CGRect(x:0,y:0,width:100,height:50)
        clickBtn?.center = self.center
        clickBtn?.setTitle("头部 按钮", for: .normal)
        clickBtn?.addTarget(self, action: #selector(self.btnClick(btn:)), for: .touchUpInside)
        self.addSubview(clickBtn!)
        
    }
    
    @objc private func btnClick(btn:UIButton){
    
        if (btnClickBlock != nil) {
            btnClickBlock!()
        }
        
        
    }
        
}

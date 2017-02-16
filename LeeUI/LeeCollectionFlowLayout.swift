//
//  LeeCollectionFlowLayout.swift
//  LeeUI
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeCollectionFlowLayout: UICollectionViewFlowLayout {

    var itemW: CGFloat = 100
    var itemH: CGFloat = 100
    
    override init() {
        super.init()
        
        // 布局相关的操作都可以放到这里来进行
        //设置每一个元素的大小
        self.itemSize = CGSize(width:100,height:150)
        //设置滚动方向
        self.scrollDirection = .vertical
        //列间距,行间距,偏移
        self.minimumInteritemSpacing = 15
        self.minimumLineSpacing = 30
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.headerReferenceSize = CGSize(width:375,height:60)
        self.footerReferenceSize = CGSize(width:375,height:80)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //苹果推荐，对一些布局的准备操作放在这里
    override func prepare() {
        //设置边距(让第一张图片与最后一张图片出现在最中央)ps:这里可以进行优化
//        let inset = (self.collectionView?.bounds.width ?? 0)  * 0.5 - self.itemSize.width * 0.5
//        self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
    }
    
    
}

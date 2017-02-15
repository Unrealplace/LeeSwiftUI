//
//  LeeCollectionViewVC.swift
//  LeeUI
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeCollectionViewVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{

    
    
//    // 1.自定义 Item 的FlowLayout
//    let flowLayout = UICollectionViewFlowLayout()
//    
//    // 2.设置 Item 的 Size
//    flowLayout.itemSize = CGSizeMake(90, 120)
//    
//    // 3.设置 Item 的排列方式
//    flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
//    
//    // 4.设置 Item 的四周边距
//    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
//    
//    // 5.设置同一竖中上下相邻的两个 Item 之间的间距
//    flowLayout.minimumLineSpacing = 20
//    
//    // 6.设置同一行中相邻的两个 Item 之间的间距
//    flowLayout.minimumInteritemSpacing = 20
//    
//    // 7.设置UICollectionView 的页头尺寸
//    flowLayout.headerReferenceSize = CGSizeMake(100, 50)
//    
//    // 8.设置 UICollectionView 的页尾尺寸
//    flowLayout.footerReferenceSize = CGSizeMake(100, 50)
//    
//    // 1.自定义 UICollectionView 的位置大小, 以及 Item 的显示样式为 flowLayout
//    var collection = UICollectionView(frame: CGRectMake(0, 64, self.view.frame.width, self.view.frame.height - 64), collectionViewLayout: flowLayout)
//    
//    // 2.设置 UICollectionView 的背景颜色
//    collection.backgroundColor = UIColor.whiteColor()
//    
//    // 3.设置 UICollectionView 垂直滚动是否滚到 Item 的最底部内容
//    collection.alwaysBounceVertical = true
//    
//    // 4.设置 UICollectionView 垂直滚动是否滚到 Item 的最右边内容
//    collection.alwaysBounceHorizontal = true
//    
//    // 5.设置 UICollectionView 的数据源对象
//    collection.dataSource = self
//    
//    // 6.设置 UICollectionView 的代理对象
//    collection.delegate = self
//    
//    // 7.设置 UICollectionView 的单元格点击(默认是 true)
//    collection.allowsSelection = true
//    
//    // 8.设置 UICollectionView 的单元格多选(默认是 false)
//    collection.allowsMultipleSelection = false
//    
//    // 9.开启 UICollectionView 的分页显示效果
//    collection.pagingEnabled = true
//
    
    
   lazy var showCollectionView:UICollectionView = {
    
    // layout 很重要  可以布局 item 也可以布局 头尾部
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width:100,height:150)
    //列间距,行间距,偏移
    layout.minimumInteritemSpacing = 15
    layout.minimumLineSpacing = 30
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
    layout.headerReferenceSize = CGSize(width:375,height:60)
    layout.footerReferenceSize = CGSize(width:375,height:80)
    
    
    let collectionView:UICollectionView = UICollectionView.init(frame:CGRect(x:0,y:0,width:self.view.bounds.width,height:self.view.bounds.height), collectionViewLayout: layout)
    
    collectionView.dataSource = self
    collectionView.delegate   = self
    collectionView.backgroundColor = UIColor.white
    collectionView.register(LeeCollectionCell.self, forCellWithReuseIdentifier: "cellid")
    collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
    
    collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer")
    collectionView.showsVerticalScrollIndicator = true
    collectionView.showsHorizontalScrollIndicator = false
    
    
    return collectionView
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(showCollectionView)
        
    }
    
    
    // Mark collection datasource

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 40
        
    }
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
  
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellid = "cellid"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! LeeCollectionCell
        
        cell.leeConfig(pa: indexPath as NSIndexPath)

        cell.imageClickBlock = {(path:NSIndexPath) ->(Void) in
        
            print("\(path)")
            
        }
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let headerIdentifier = "header"
        let footerIdentifier = "footer"
        
        
        /**
         *   注意要点
         *   1.supplementaryView 的返回类型为 UICollectionReusableView ，不能混淆，Swift里边对于返回值的类型要去很严格。
         *   2.UICollectionReusableView 继承自 UIView ，是 UIView 的子类
         *   3.kind 分为 footer 和 header 两种，区分开来
         *   4.kind 和 identifier 要对应起来，因为是两个不同的 reuse identifier
         */
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! CollectionReusableView
            header.backgroundColor = UIColor.purple
            header.btnClickBlock = {() ->(Void) in
            
                print("header")
            }
            return header
        }else{
        
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath) as! CollectionReusableView
           
            
            footer.backgroundColor = UIColor.red
            footer.btnClickBlock = {() ->(Void) in
                
               print("footer")
            }
            return footer
        }
        
    }
        
}
    
    
    
    


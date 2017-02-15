//
//  LeeTableCell.swift
//  LeeUI
//
//  Created by mac on 17/2/14.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

typealias ImageClickBlock = () ->(Void)


class LeeTableCell: UITableViewCell {

   open var cellHeight:CGFloat?
    
    var titleSize:CGSize?
    var contentSize:CGSize?
    var myClickBlock:ImageClickBlock?
    
    
    // 懒加载 控件
   private lazy var headImageView:UIImageView = {
    
        let imgV = UIImageView();
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        tap.addTarget(self, action: #selector(LeeTableCell.imageClick))
        imgV.addGestureRecognizer(tap)
        imgV.contentMode = .scaleAspectFit
        imgV.isUserInteractionEnabled = true
    
        return imgV
    }()
    
    private lazy var titleLabel:UILabel = {
    
        let label = UILabel();
        label.backgroundColor = UIColor.red
        return label
        
    }()
   private lazy var contentLabel:UILabel = {
        let label = UILabel();
        label.backgroundColor = UIColor.blue
        return label
        
    }()
    
    
    func imageClick(){
    
        if (self.myClickBlock != nil) {
             self.myClickBlock!()
        }

     }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.LeeSetUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     }
    

    func LeeSetUI(){
        
        self.contentView.addSubview(headImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(contentLabel)
        
       
        headImageView.frame = CGRect(x:0,y:0,width:120,height:150)
        
        titleLabel.frame = CGRect(x:headImageView.bounds.maxX,y:0,width:120,height:30)
        
        contentLabel.frame = CGRect(x:headImageView.bounds.maxX,y:titleLabel.bounds.maxY + 10,width:130,height:40)
        
        
        self.selectionStyle = .none
        
        
        
    }
    func  commonSet(model:LeeDataModel){
    
        headImageView.image = UIImage.init(named: model.imageUrl! as String)
        titleLabel.text = model.titleName as String?
        contentLabel.text = model.contentName as String?
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        
    }
    
    override func layoutSubviews() {
 
    self.frame = CGRect(x:0,y:0,width:375,height:headImageView.frame.size.height + 10)
 
    
    }
    
    deinit {
        
        print("cell dealloc")
    }
    

}

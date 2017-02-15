//
//  LeeUITableViewVC.swift
//  LeeUI
//
//  Created by mac on 17/2/14.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeUITableViewVC: UIViewController,UITableViewDelegate,UITableViewDataSource{

 
    var Citys:[String] = ["北京","上海","广州","深圳","杭州"]
    private lazy var leeTableView:UITableView = {
    
        let tableV = UITableView(frame:CGRect(x:0,y:0,width:self.view.bounds.size.width,height:self.view.bounds.size.height),style:UITableViewStyle.plain)
        tableV.dataSource = self
        tableV.delegate = self
 
        return tableV
        
        
    }()
    
    //控制器生命周期
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        leeSetUI()
        

    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
        
    }
    
    
    
    
    
    func leeSetUI() {
        
        self.view.addSubview(leeTableView)
        
        let rightBtn = UIButton(frame:CGRect(x:0,y:0,width:60,height:30))
        
        rightBtn.backgroundColor = UIColor.red
        
        rightBtn.setTitle("edit", for: UIControlState.normal)
        
        rightBtn.addTarget(self, action: #selector(LeeUITableViewVC.editClick(btn:)), for: UIControlEvents.touchUpInside)
        
        let rightItem = UIBarButtonItem.init(customView: rightBtn)
        
        self.navigationItem.rightBarButtonItem = rightItem
        
        
        
        
        
    }
    
    func editClick(btn:UIButton){
    
        btn.isSelected =  !btn.isSelected
        
        if btn.isSelected {
          
            leeTableView.setEditing(true, animated: true)
            
        }else{
        
            leeTableView.setEditing(false, animated: true)

        }
        
    }
    
    // 代理方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = LeeDetailTableVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Citys.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let identifier="identtifier"
        
        var cell=tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier);
            cell?.detailTextLabel?.font = UIFont .systemFont(ofSize: CGFloat(13))
            cell?.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton

        }
        
        cell?.textLabel?.text = Citys[indexPath.row];
        cell?.detailTextLabel?.text = "待添加内容";
        // 其它设置方式
//        cell?.accessoryType=UITableViewCellAccessoryType.disclosureIndicator
//        cell?.accessoryType = UITableViewCellAccessoryType.detailButton
        cell?.imageView?.image = UIImage.init(named: "屏幕快照 2017-02-14 13.00.59")

        return cell!
        
        
    }
    
    
    // tableview 的高级玩法
    // 指定单元格是否具有 编辑功能
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    //指定单元格每一行的编辑类型
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row == Citys.count - 1 {
            
             return .insert
        }else{
        
            return .delete
        }
    }
    // 指定单元格是否允许拖动
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // 点击完编辑后调用的方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
           Citys.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
        }else if editingStyle == .insert{
         
            Citys.append("郑州");
            tableView.insertRows(at: [indexPath], with: .middle)
        }else{
        
        }
    }
    // 编辑状态开启后 就可以调用这个方法来移动cell
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        if sourceIndexPath != destinationIndexPath {
            let value = Citys[sourceIndexPath.row]
            
            Citys.remove(at: sourceIndexPath.row)
            
            if destinationIndexPath.row > Citys.count {
                 Citys.append(value)
            }else{
            
                Citys.insert(value, at: destinationIndexPath.row)
            }
            
        }
    }
    // 行缩进
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
         return indexPath.row
    }
    

    
}

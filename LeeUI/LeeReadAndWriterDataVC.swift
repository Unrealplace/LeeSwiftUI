//
//  LeeReadAndWriterDataVC.swift
//  LeeUI
//
//  Created by mac on 17/2/16.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeReadAndWriterDataVC: LeeBVC,UITableViewDelegate,UITableViewDataSource{

    var showTableView:UITableView?
     var listArr = ["userDefault 和对象归档","文件操作",""]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        showTableView = UITableView(frame:CGRect(x:0,y:0,width:self.view.bounds.size.width, height:self.view.bounds.size.height),style:UITableViewStyle.grouped)
        
        showTableView?.dataSource = self
        showTableView?.delegate   = self
        
        self.view.addSubview(showTableView!)

        
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let vc = LeeUserDefaultandArchiveVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = LeeFileOperationVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
             break
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return listArr.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "mycell")
        
        cell.detailTextLabel?.text = self.listArr[indexPath.row]
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60;
    }
    

    

}

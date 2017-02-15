//
//  LeeDetailTableVC.swift
//  LeeUI
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeDetailTableVC: UITableViewController {

    var dataModel:LeeDataModel?
    
    var dataArray:[LeeDataModel]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        
        self.tableView.register(LeeTableCell.self, forCellReuseIdentifier: "cellid")
        self.tableView.register(LeeTableHeadAndFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        
        
        dataModel = LeeDataModel()
        dataModel?.contentName = NSString.init(string: "oliver lee come frome earth")
        dataModel?.titleName   = NSString.init(string: "oliver lee come frome earth")
        dataModel?.imageUrl    = NSString.init(string: "屏幕快照 2017-02-14 13.00.59")
        
        dataModel?.cellHeight  = 0
        
        
        
        self.tableView.reloadData()
        
        
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cell:LeeTableCell = self.tableView(tableView,cellForRowAt:indexPath)
        
        return cell.frame.size.height
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        
        let identifier = "header"
        
        let cell  = LeeTableHeadAndFooterView.init(reuseIdentifier: identifier)
        
        cell.LeeLayoutUI()

        cell.clickBlock = {(num:Int)->(Void) in
            
            print("\(num)")
           
            
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let identifier = "header"
        
        let cell  = LeeTableHeadAndFooterView.init(reuseIdentifier: identifier)
        
        cell.LeeLayoutUI()
        
        cell.clickBlock = {(num:Int)->(Void) in
            
            print("\(num)")
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         return 80
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> LeeTableCell {
        
        let identifier="cellid"
        
        let cell  = LeeTableCell.init(style: .default, reuseIdentifier: identifier)
        
        cell.commonSet(model: dataModel!)
        
        cell.myClickBlock = {()->(Void) in
        
            print("block click")
        }
        
        return cell
    }
    

    
}

//
//  ViewController.swift
//  LeeUI
//
//  Created by mac on 17/2/13.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var showTableView:UITableView?
    var listArr = ["LeeWindowAndView","LeeUILabelVC","LeeUITextFieldVC","LeeUIButtunVC","LeeUITableViewVC","LeeCollectionViewVC","LeeOhterUI","LeeReadAndWriterDataVC"]
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.LeeSetUI()
        
        
              
    }
    
    
    func LeeSetUI() {
        showTableView = UITableView(frame:CGRect(x:0,y:0,width:self.view.bounds.size.width, height:self.view.bounds.size.height),style:UITableViewStyle.grouped)
        
        showTableView?.dataSource = self
        showTableView?.delegate   = self
        
        self.view.addSubview(showTableView!)
 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

      
//        let string = self.listArr[indexPath.row]
//        
//        let newStr = "LeeUI." + "LeeWindowAndView"
//        
//        let VCclass =  NSClassFromString(newStr) as? LeeBaseViewController
//        
//        let vc:LeeBaseViewController = VCclass.type(of: init)()
//        
//        
//        
//       
//        self.navigationController?.pushViewController(vc, animated: true)

        

        
        switch indexPath.row {
        case 0:
            let  vc = LeeWindowAndView()
            
            self.navigationController?.pushViewController(vc, animated: true)
        
            break;
        case 1:
            let vc = LeeUILabelVC()
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            break;
        case 2:
            let vc = LeeUITextFieldVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
            break;
            
        case 3:
            let vc = LeeUIButtunVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
            break;
            
        case 4:
            let vc = LeeUITableViewVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
            break;
            
        case 5:
            let vc = LeeCollectionViewVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
            break;
            
        case 6:
            let vc = LeeOhterUI()
            self.navigationController?.pushViewController(vc, animated: true)
            
            break;
            
        case 7:
            let vc = LeeReadAndWriterDataVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
            break;

        default:
            break;
            
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


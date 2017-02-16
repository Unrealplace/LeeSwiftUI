
//
//  LeeOhterUI.swift
//  LeeUI
//
//  Created by mac on 17/2/16.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeOhterUI: LeeBVC,UIAlertViewDelegate,UIActionSheetDelegate,UISearchBarDelegate{

   lazy var alertBtn:UIButton = {
    
    let btn = UIButton()
    btn.frame = CGRect(x:100,y:100,width:120,height:30)
    btn.setTitle("show alert", for: .normal)
    btn.backgroundColor = UIColor.orange
    btn.addTarget(self, action: #selector(self.showAlert), for: .touchUpInside)
    return btn
    }()
    
    
    lazy var alertActionBtn:UIButton = {
        
        let btn = UIButton()
        btn.frame = CGRect(x:100,y:180,width:120,height:30)
        btn.setTitle("show alert", for: .normal)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: #selector(self.showAction), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var alertVCBtn:UIButton = {
        
        let btn = UIButton()
        btn.frame = CGRect(x:100,y:260,width:120,height:30)
        btn.setTitle("show alert", for: .normal)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: #selector(self.showVC), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.view.addSubview(alertBtn)
        self.view.addSubview(alertActionBtn)
        self.view.addSubview(alertVCBtn)
        addToolBar()
        addSearchBar()
        
     }
    
    func showAlert(){
    
        // 下面的废弃了
        // 单一按钮的
        let oneBtnAlert:UIAlertView = UIAlertView.init(title: "提醒", message: "oliver lee", delegate: self, cancelButtonTitle: "sure")
        
        oneBtnAlert.show()
        
        // 多个按钮的
        let moreBtnAlert:UIAlertView = UIAlertView.init(title: "tips", message: "oliver lee lee oliver", delegate: self, cancelButtonTitle: "cancel", otherButtonTitles: "ok", "sure","no","good")
        
        moreBtnAlert.show()
        
        
    }
    
    func showAction(){
    
        let action:UIActionSheet = UIActionSheet.init(title: "tips", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: "oliver lee")
        
        
        action.show(in: self.view)
        
    }
    
    func showVC() {
        
        let alertVC:UIAlertController = UIAlertController.init(title: "tips", message: "oliver lee is good man", preferredStyle: .alert)
        //
        let cancelAction = UIAlertAction.init(title: "cancel", style: .cancel, handler:{UIAlertAction -> Void in
            
            print("cancel")
            
        })
        let sureAction = UIAlertAction.init(title: "sure", style: .default
            , handler: {(atc:UIAlertAction) ->Void in
        
           print("sure")
                
            
                let newVC:UIAlertController = UIAlertController.init(title: "tips", message: "oliver lee iss a good man", preferredStyle: .actionSheet)
                
                let action = UIAlertAction.init(title: "cancael", style: .cancel, handler: {(cancel:UIAlertAction) ->Void in
                    print("cancel")

                    
                })
                let Action = UIAlertAction.init(title: "sure", style: .default
                    , handler: {(atc:UIAlertAction) ->Void in
                        
                        print("sure")

                })
                newVC.addAction(action)
                newVC.addAction(Action)
                
                self.present(newVC, animated: true, completion: {() ->Void in

                
                })
        
        })
        
        
                
                
                
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(sureAction)
        alertVC.addTextField(configurationHandler: {(text:UITextField) ->Void in
        
            text.placeholder = "login"
            
        
        })
                
                
        alertVC.addTextField(configurationHandler: {(text:UITextField) ->Void in
        
            text.placeholder = "passwd"
            
        })
        
        
        self.present(alertVC, animated: true, completion: {() ->Void in
        
            
            
            print("endend end end")
            
        })
        


    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
        print("\(buttonIndex)")
    }
   
   
        
        
    }
    
    func addToolBar(){
        
        
        let toolBar:UIToolbar = UIToolbar.init(frame: CGRect(x:0,y:300,width:375,height:60))
        
        //创建一个间距
        let spac = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: "barButtonItemClicked", action: nil)
        
        
        //创建一个返回按钮
        let back = UIBarButtonItem.init(title: "back", style: .plain, target: self, action: #selector(self.barButtonItemClicked))
        
        //
        
          let go = UIBarButtonItem.init(title: "gogog", style: .plain, target: self, action: #selector(self.barButtonItemClicked))
        
        toolBar.backgroundColor = UIColor.red
        
        toolBar.items = [spac,back,spac,go,spac]
        
        self.view.addSubview(toolBar)
        
        
        
    }
    
    func addSearchBar() {
        let searchBar = UISearchBar.init(frame: CGRect(x:0,y:350,width:375,height:50))
        
        //设置bar 的样式
        searchBar.barStyle = .default
        //
        searchBar.delegate = self
        //设置 bar 上显示的文字
        searchBar.text     = "oliver lee"
        
        //设置顶部的 单行文字
        searchBar.prompt = "please download app"
        
        //站位
        searchBar.placeholder = "oliver lee is good man"
        
        //控件右端显示一个书的按钮
        searchBar.showsBookmarkButton = true
        
        //显示cancel 按钮
        searchBar.showsCancelButton = true
        
        //显示搜素结果按钮
        searchBar.showsSearchResultsButton = true
        
        //搜索结果按钮是否被选中
        
        searchBar.isSearchResultsButtonSelected = true
        
        // bar 的 颜色
        searchBar.tintColor = UIColor.yellow
        //是否开启透明效果
        searchBar.isTranslucent = true
        //设置自动大写
        
        searchBar.autocapitalizationType = .allCharacters
        
        //文本对象自动矫正风格
        
        searchBar.autocorrectionType = .default
        //键盘样式
        
        searchBar.keyboardType = .default
        
        //下部的选择栏
        searchBar.scopeButtonTitles = ["oliver","yamg","lee"]
        //选中索引
        searchBar.selectedScopeButtonIndex = 1
        //选择栏是否显示出来
        searchBar.showsScopeBar = true
        
        
        self.view.addSubview(searchBar)
        

        
    }
    
    
    
    
    func barButtonItemClicked() {
        print("click")
    }

}

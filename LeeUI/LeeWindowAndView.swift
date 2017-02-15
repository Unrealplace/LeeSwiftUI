//
//  LeeWindowAndView.swift
//  LeeUI
//
//  Created by mac on 17/2/13.
//  Copyright © 2017年 https://github.com/Unrealplace. All rights reserved.
//

import UIKit

class LeeWindowAndView: LeeBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        self.view.backgroundColor = UIColor.white
        
        let screenBounds:CGRect = UIScreen.main.bounds;
        
        print(screenBounds);
        
        // 窗口等级 从高到底排列
        print(UIWindowLevelAlert)
        print(UIWindowLevelStatusBar)
        print(UIWindowLevelNormal)
        
        // UIView
        
        let redView = UIView();
        
        redView.backgroundColor = UIColor.red;
        
        redView.frame = CGRect(x:0,y:0,width:120,height:120);
        
        
        
        //添加点击事件
        let tap = UITapGestureRecognizer();
        tap.numberOfTapsRequired = 1;
        
        tap.addTarget(self, action:#selector(LeeWindowAndView.tapFun))
        
        redView.isUserInteractionEnabled = true;
        
        redView.addGestureRecognizer(tap);
        
        
        
        //下面大的视图
        let bigView = UIView();
        
        bigView.backgroundColor = UIColor.blue;
        
        bigView.frame = CGRect(x:130,y:130,width:200,height:200);
        
        bigView.center = self.view.center
        
        self.view.addSubview(bigView);
        
        // 算内部中心点要用这样来
        redView.center.x = bigView.bounds.size.width/2.0;
        
        redView.center.y = bigView.bounds.size.height/2.0;
        
        bigView.addSubview(redView);
        
        
        // 将当前坐标转换到另一个图层
        let point = bigView.convert(redView.frame.origin, to: self.view)
        
        print("红色的视图转换到self.view 上 \(point)")
        
        // 设备的旋转
        //        public enum UIDeviceOrientation : Int {
        //
        //
        //            case unknown
        //
        //            case portrait // Device oriented vertically, home button on the bottom
        //
        //            case portraitUpsideDown // Device oriented vertically, home button on the top
        //
        //            case landscapeLeft // Device oriented horizontally, home button on the right
        //
        //            case landscapeRight // Device oriented horizontally, home button on the left
        //
        //            case faceUp // Device oriented flat, face up
        //            
        //            case faceDown // Device oriented flat, face down
        //        }
        
        
        

    
    }
    
    //旋转的流程如下：
    //    1.设备旋转的时候，UIKit 接收旋转事件。
    //    2.UIKit 通过 appdelegate 通知当前的 widow
    //    3.widow 会通知它的 rootViewcontroller ，判断 viewContrller 所支持的旋转方向，完成旋转。
    //    4.若果存在弹出的 viewController ，系统会根据弹出的viewcontroller 来判断是否进行旋转。
    //
    //    5.如果程序中容许个别界面旋转｛
    //
    //    1.先判断当前viewcontroller 是否支持旋转，如果支持进入下面的代理方法，否则结束旋转流程。
    //    ｝
    //    6.如果vcA 弹出 vcB ，A 不可见，所以接收不到屏幕旋转的信息，如果屏幕发生变化后退出 B ，回到 A，发现 A 的界面没有根据屏幕旋转做出调整，这个 时候可以通过viewwillapper 方法更改UI。
    
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        
        
        print("将要旋转");
        
    }
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        print("将要执行动画旋转");
        
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        print("结束旋转");
        
    }
    
    
    
    func tapFun() {
        
        print("oliver lee")
        
        let vc  = LeeBVC();
        
        self.present(vc, animated: true)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

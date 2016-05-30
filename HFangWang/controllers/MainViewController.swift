//  主视图
//  MainView.swift
//  HFangWang
//
//  Created by guominglong on 16/2/1.
//  Copyright © 2016年 guominglong. All rights reserved.
//

import Foundation
public class MainViewController:UITabBarController{
    
    
    private var stateBarVisible:Bool = true;
    
    private var sediao:UIColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1);
    public override func viewDidLoad() {
        super.viewDidLoad();
        
        //添加子页面
        self.tabBar.barTintColor = sediao//背景色
        self.tabBar.tintColor = UIColor.whiteColor();//选中字体后的颜色
        
        self.preferredStatusBarStyle()
    }
    
    public override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(false, animated: false);
        //隐藏导航条的返回按钮
        self.navigationController?.navigationBar.barTintColor = sediao;
        
        
        let pages:[UIViewController] = [HeiFangController(),HeiZhongJieController(),UserCenterController()];
        var tabBarItems:[UITabBarItem] = [UITabBarItem(title: "H房", image: nil, selectedImage: nil),UITabBarItem(title: "H中介", image: nil, selectedImage: nil),UITabBarItem(title: "用户中心", image: nil, selectedImage: nil)];
        
        let theight:CGFloat = self.view.frame.size.height - self.tabBar.frame.height - (self.navigationController?.navigationBar.frame.height)!;
        let tframe:CGRect = CGRect(x: 0, y: self.view.frame.size.height - (self.navigationController?.navigationBar.frame.height)!, width: self.view.frame.size.width, height: 60);
        for(var i:Int=0;i<pages.count;i++)
        {
            pages[i].view.frame = tframe;
            pages[i].tabBarItem = tabBarItems[i];
            pages[i].tabBarItem.titlePositionAdjustment.vertical = -5;
        }
        self.setViewControllers(pages, animated: false);
        self.selectedIndex = 0;
        self.title = tabBarItems[0].title;
        
        
        let sha:NSShadow = NSShadow();
        sha.shadowColor = UIColor.blackColor();
        sha.shadowOffset = CGSize(width: 1, height: 1);
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSShadowAttributeName:sha];
        self.navigationItem.hidesBackButton = true;
    }
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event);
        stateBarVisible = !stateBarVisible;
        self.prefersStatusBarHidden();
        UIView.animateWithDuration(0.3) { () -> Void in
            self.setNeedsStatusBarAppearanceUpdate();
        }
        
    }
    
    public override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.title = item.title;
    }
    
    
}
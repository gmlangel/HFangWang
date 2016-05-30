//
//  LaunchView.swift
//  HFangWang
//
//  Created by guominglong on 16/2/1.
//  Copyright © 2016年 guominglong. All rights reserved.
//

import Foundation
public class LaunchViewController:UIPageViewController{
    
    private var pages:[UIViewController]!;//轮播的页面集合
    private var currentPageIDX:Int = 0;
    private var loopTimer:NSTimer!;//轮播工具
    private var pageToolBar:UIPageControl!;
    public var loopT:NSTimeInterval! = 3;//3秒轮播
    
    public init(_views:[UIView],transitionStyle: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : AnyObject]?) {
        super.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: options);
        
        pages = [];
        let j:Int = _views.count;
        let cf:CGRect = UIApplication.sharedApplication().statusBarFrame;
        for(var i:Int=0 ;i<j; i++)
        {
            let vc:UIViewController = UIViewController();
            vc.view.addSubview(_views[i]);
            _views[i].frame.origin.y = cf.size.height;
            _views[i].frame.size.height = _views[i].frame.size.height - cf.size.height;
            pages.append(vc);
        }
    }
    
    

    public required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad();
        pageToolBar = UIPageControl(frame: CGRect(x: 0, y: 0, width: 150, height: 30));
        pageToolBar.enabled = false;
        self.view.addSubview(pageToolBar);
        pageToolBar.center = CGPoint(x: self.view.frame.size.width/2.0, y: self.view.frame.size.height - 30);
        pageToolBar.numberOfPages = pages.count;
        pageToolBar.currentPage = currentPageIDX;
        
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: false);
        if(loopTimer == nil)
        {
            
            loopTimer = NSTimer.scheduledTimerWithTimeInterval(loopT, target: self, selector: Selector("changePage"), userInfo: nil, repeats: true);
        }
        currentPageIDX = 0;
        
        self.setViewControllers([pages[currentPageIDX]], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil);
        
    }
    
    public func changePage()
    {
        if(currentPageIDX + 1 < pages.count)
        {
            currentPageIDX  =  currentPageIDX + 1;
        }else{
            loopTimer.invalidate();//停止计时器
            hideAni();
            return;
        }
        self.setViewControllers([pages[currentPageIDX]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil);
        pageToolBar.currentPage = currentPageIDX;
    }
    
    
    /**
     隐藏引导页
     */
    public func hideAni()
    {
        //self.view.window?.rootViewController = NaviController(rootViewController: MainView());
        self.showViewController(MainViewController(), sender: self);
    }
}
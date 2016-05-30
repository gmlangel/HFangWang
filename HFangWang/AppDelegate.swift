//
//  AppDelegate.swift
//  HFangWang
//
//  Created by guominglong on 16/2/1.
//  Copyright © 2016年 guominglong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var config:NSMutableDictionary!;
    var mainView:MainViewController!;
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        ginit();
        self.window?.makeKeyAndVisible();
        return true;
    }
    
    func ginit()
    {
        let b:Bool = loadConfig();
        var contentViewController:UIViewController;
        if(b != false)
        {
            //第一次运行app，显示引导页
            var launchView:LaunchViewController;
            var imgviews:[UIImageView] = [];
            for(var i:Int = 0 ;i<5;i++)
            {
                let imgV:UIImageView = UIImageView(frame: self.window!.bounds);
                imgV.image = UIImage(named: "launch\(i)");
                imgviews.append(imgV);
            }
            launchView = LaunchViewController(_views: imgviews, transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options:nil);
            contentViewController = launchView;
            //self.window?.rootViewController = launchView;
        }else{
            //非第一次运行app，直接显示主界面
            contentViewController = MainViewController();
        }
        let navi:NaviController = NaviController(rootViewController: contentViewController);
        self.window?.rootViewController = navi;
        
    }
    
    func loadConfig() -> Bool
    {
        let path:String = "\(NSBundle.mainBundle().bundlePath)/gmlConfig.con";
        let b:Bool = NSFileManager.defaultManager().fileExistsAtPath(path);
        if(b == true)
        {
            //存在配置文件，证明不是第一次运行程序，所以不需要引导页
            config = NSMutableDictionary(contentsOfFile: path);
        }else{
            //第一次运行app，需要引导页
            config = NSMutableDictionary();
            config.setValue("郭明龙", forKey: "NickName");
            config.writeToFile(path, atomically: false);
        }
        
        return b;
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


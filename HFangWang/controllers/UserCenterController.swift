//  用户中心
//  UserCenterController.swift
//  HFangWang
//
//  Created by guominglong on 16/2/2.
//  Copyright © 2016年 guominglong. All rights reserved.
//

import Foundation
public class UserCenterController:UIViewController{

    
    public override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.greenColor();
       
        
        let btn:UIButton = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 30));
        btn.setTitle("哈哈", forState: UIControlState.Normal);
        btn.backgroundColor = UIColor.redColor();
        self.view.addSubview(btn);
    }
 
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        NSLog("\(self.topLayoutGuide.length)");
    }
    
}
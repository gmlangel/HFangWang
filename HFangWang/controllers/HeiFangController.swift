//
//  HeiFangController.swift
//  HFangWang
//
//  Created by guominglong on 16/2/2.
//  Copyright © 2016年 guominglong. All rights reserved.
//

import Foundation
public class HeiFangController:UIViewController{

    public override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.redColor();
        
    }
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        NSLog("\(self.topLayoutGuide.length)");
        
    }

}
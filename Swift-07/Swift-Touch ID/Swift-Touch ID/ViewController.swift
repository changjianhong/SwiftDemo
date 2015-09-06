//
//  ViewController.swift
//  Swift-Touch ID
//
//  Created by 常健洪 on 15/8/10.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        
        button.setTitle("authentication", forState: UIControlState.Normal)
        
        self.view.addSubview(button)
        
        button.addTarget(self, action: "touchID", forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    func touchID(){
        
        var laContext = LAContext()
        
        var authError : NSError?
        
        var errorReason = "keep the secret"
        
        if laContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError) {
            
            laContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: errorReason, reply: { (succeed, error) -> Void in
                
                if succeed{
                    println("succeed")
                } else {
                    println("failed")
                }
                
            })
            
        } else {
            var alert = UIAlertView(title: "Can not do authenticatation", message: nil, delegate: self, cancelButtonTitle: "cancel")
        }
        
    }


}


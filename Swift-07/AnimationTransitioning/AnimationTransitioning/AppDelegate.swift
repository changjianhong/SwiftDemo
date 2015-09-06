//
//  AppDelegate.swift
//  AnimationTransitioning
//
//  Created by 常健洪 on 15/8/17.
//  Copyright (c) 2015年 常健洪. All rights reserved.
//


import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    ///由于swift中没有Define宏的概念了 所以带参数的宏要用 func来代替
    func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.rootViewController = self._configuredRootViewController()
        
        window?.makeKeyAndVisible()

        return true
    }

    func _configuredRootViewController() -> UIViewController {

        var viewControllerArray    = self._configuredChildViewControllers()

        var rootViewController = JHContainerController(viewControllers: viewControllerArray);

        return rootViewController
    }


    func _configuredChildViewControllers() -> NSArray {

        var childViewControllers = NSMutableArray(capacity: 3)

        var configurations     = [["title":"First","color":RGBA(0.2, g: 0.6, b: 0.4, a: 1)],["title":"Second","color":RGBA(0.2, g: 0.8, b: 1, a: 1)],["title":"Third","color":RGBA(0.6, g: 0.6, b: 0.4, a: 1)]]

        for configuration in configurations {
            
            var vc                      = ChildViewController()
            vc.title                    = configuration["title"] as? String
            vc.themeColor               = configuration["color"] as? UIColor
            vc.tabBarItem.image         = UIImage(named: (configuration["title"] as? String)!)
            vc.tabBarItem.selectedImage = UIImage(named: (configuration["title"] as? String)!.stringByAppendingString(" Selected"))
            
            childViewControllers.addObject(vc)
        }

        return childViewControllers
    }


}


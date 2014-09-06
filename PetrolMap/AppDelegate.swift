//
//  AppDelegate.swift
//  PetrolMap
//
//  Created by Liang on 9/6/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//  
//  Key : vZTqCaSktGPCsdDzOocMW0r2

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , BMKGeneralDelegate{
                            
    var window: UIWindow?;
//    var mapManager: MapManager?;
    
    var _mapManager: BMKMapManager?;

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
//        var mapManager = MapManagerDelegate();
        _mapManager = BMKMapManager();
        println(_mapManager);
        var ret = _mapManager?.start("vZTqCaSktGPCsdDzOocMW0r2", generalDelegate: self)
        if(ret == false){
            println("BMKMapManager init failed!");
        }else{
            println("BMKMapManager init success!");
        }
        
        var idtf = NSBundle.mainBundle().bundleIdentifier;
        println(idtf);
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds);
        
        var mainController = MainViewController(nibName: String("MainViewController"), bundle: nil);
        var naviController = UINavigationController(rootViewController: mainController);
        
        window?.rootViewController = naviController;
        window?.backgroundColor = UIColor.whiteColor();
        window?.makeKeyAndVisible();
        
        return true
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
    
    func onGetNetworkState(iError: Int32) {
        if (0 == iError) {
            println("联网成功");
        }
        else{
            println("onGetNetworkState %d",iError);
        }
    }
    
    
    func onGetPermissionState(iError: Int32) {
        if (0 == iError) {
            println("授权成功");
        }
        else {
            println("onGetPermissionState %d",iError);
        }
    }


}


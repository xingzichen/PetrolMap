//
//  DataManager.swift
//  PetrolMap
//
//  Created by Liang on 9/7/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

import Foundation

class XZDataManager{
    
    let dirs : [String]? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String];
    
    
    class func sharedInstance() -> XZDataManager{
        struct qzSingle{
            static var predicate:dispatch_once_t = 0
            static var instance:XZDataManager? = nil
        }
        dispatch_once(&qzSingle.predicate, {
            qzSingle.instance = XZDataManager();
        });
        return qzSingle.instance!;
    }
    
    var stationData: AnyObject?;
    var locationData: AnyObject?;
    
    func loadData() -> Bool{
        
        var error:NSError?;
        
        // Load Station Data
        var filePathStation = NSBundle.mainBundle().pathForResource("stations", ofType: "json");
        let contentStation = NSString.stringWithContentsOfFile(filePathStation!, encoding: NSUTF8StringEncoding, error: nil);
        var dataStation:NSData! = contentStation.dataUsingEncoding(NSUTF8StringEncoding);
        stationData = NSJSONSerialization.JSONObjectWithData(dataStation , options: NSJSONReadingOptions.MutableContainers, error:nil);
        
        // Load Location Data
        var filePathLocation = NSBundle.mainBundle().pathForResource("locations", ofType: "json");
        var dataLocation:NSData! = NSData(contentsOfFile: filePathLocation!);
        locationData = NSJSONSerialization.JSONObjectWithData(dataLocation, options: NSJSONReadingOptions.MutableContainers, error: nil);
        
        
        return true;
    }
    
}

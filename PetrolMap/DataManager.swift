//
//  DataManager.swift
//  PetrolMap
//
//  Created by Liang on 9/7/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

import Foundation

class DataManager{
    
    class func sharedInstance() -> DataManager{
        struct qzSingle{
            static var predicate:dispatch_once_t = 0
            static var instance:DataManager? = nil
        }
        dispatch_once(&qzSingle.predicate, {
            qzSingle.instance = DataManager();
        });
        return qzSingle.instance!;
    }
    
    
    
}

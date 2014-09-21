//
//  CustomPointAnnotation.swift
//  PetrolMap
//
//  Created by Liang on 9/8/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

import UIKit

class CustomPointAnnotation :BMKPointAnnotation{
    // 标注点传递的callout吹出框显示的信息
    var pointCalloutInfo:[NSObject:AnyObject]?;
    
    override func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
        
    }
}

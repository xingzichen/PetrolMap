//
//  CalloutMapAnnotation.swift
//  PetrolMap
//
//  Created by Liang on 9/10/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

import Foundation

class CalloutMapAnnotation : BMKShape{
    var latitude:CLLocationDegrees?;
    var longtitude:CLLocationDegrees?;
    
    init(lat: CLLocationDegrees){
        super.init();
        
    }
}
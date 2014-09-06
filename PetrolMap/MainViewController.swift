//
//  MainViewController.swift
//  PetrolMap
//
//  Created by Liang on 9/6/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, BMKMapViewDelegate {
    
    var mapView: BMKMapView?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: 320, height: 480));
        self.view = mapView!;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
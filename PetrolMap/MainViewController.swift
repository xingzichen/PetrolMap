//
//  MainViewController.swift
//  PetrolMap
//
//  Created by Liang on 9/6/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, BMKMapViewDelegate,BMKLocationServiceDelegate {
    
    var _mapView: BMKMapView?;
    var _locationService: BMKLocationService?;
    var _dataManager: XZDataManager?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: 320, height: 460));
        self.view = _mapView!;
        
        _locationService = BMKLocationService();
        
        _dataManager = XZDataManager.sharedInstance();
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        _mapView?.delegate = self;
        _locationService?.delegate = self;
        
        _locationService?.startUserLocationService();
        
        _mapView?.showsUserLocation = true;
        _mapView?.userTrackingMode = BMKUserTrackingModeFollow;
        _mapView?.showsUserLocation = true;
        
        var pointAnnotation = CustomPointAnnotation();
        
//        pointAnnotation.pointCalloutInfo = _dataManager?.stationData?;
//        println(_dataManager?.stationData?.valueForKey("coordinates"));
        //println(pointAnnotation.pointCalloutInfo);
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        _mapView?.delegate = nil;
        _locationService?.delegate = nil;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didUpdateUserHeading(userLocation: BMKUserLocation!) {
        _mapView?.updateLocationData(userLocation);
    }
    
    func didUpdateUserLocation(userLocation: BMKUserLocation!) {
        _mapView?.updateLocationData(userLocation);
    }
    
}
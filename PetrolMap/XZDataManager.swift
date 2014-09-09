//
//  DataManager.swift
//  PetrolMap
//
//  Created by Liang on 9/7/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

import Foundation

class XZDataManager{
    
    var stations: [StationData]?;
    var suggestions: SuggestedStation?;
    
    let dirs : [String]? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String];
    
    
    class func sharedInstance() -> XZDataManager{
        struct qzSingle{
            static var predicate:dispatch_once_t = 0
            static var instance:XZDataManager? = nil
        }
        dispatch_once(&qzSingle.predicate, {
            qzSingle.instance = XZDataManager();
//            println("XZDataManager single instance init!");
        });
        return qzSingle.instance!;
    }
    
    
    
    func loadData() -> Bool{
        
        var error:NSError?;
        var stationData: NSDictionary?;
        var suggestionData: NSDictionary?;
        
        // Load Station Data
        var filePathStation = NSBundle.mainBundle().pathForResource("stations", ofType: "json");
        let contentStation = NSString.stringWithContentsOfFile(filePathStation!, encoding: NSUTF8StringEncoding, error: nil);
        var dataStation:NSData! = contentStation.dataUsingEncoding(NSUTF8StringEncoding);
        stationData = NSJSONSerialization.JSONObjectWithData(dataStation , options: NSJSONReadingOptions.MutableContainers, error:nil) as? NSDictionary;
//        println(stationData?.valueForKey("coordinates"));
        parseStations(stationData?.valueForKey("stations") as NSArray);
        
        // Load Location Data
        var filePathLocation = NSBundle.mainBundle().pathForResource("suggestion", ofType: "json");
        var dataSuggestion:NSData! = NSData(contentsOfFile: filePathLocation!);
        suggestionData = NSJSONSerialization.JSONObjectWithData(dataSuggestion, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary;
        parseSuggestions(suggestionData?.valueForKey("data") as NSDictionary );
        
        return true;
    }
    
    func parseStations(stationData: NSArray){
        // 初始化数组
        stations = Array<StationData>();
        for (var i=0; i<stationData.count; ++i){
            var dict = stationData[i] as NSDictionary;
            var item:StationData = StationData();
            item.address = dict.valueForKey("address") as String;
            item.busystatus = dict.valueForKey("busystatus") as NSInteger;
            item.distanct = dict.valueForKey("distanct") as CGFloat;
            item.is_creditcard = dict.valueForKey("is_creditcard") as String;
            item.is_membercard = dict.valueForKey("is_membercard") as String;
            item.is_promo = dict.valueForKey("is_promo") as String;
            item.latitude = dict.valueForKey("latitude") as String;
            item.longitude = dict.valueForKey("longitude") as String;
            item.oil_wear = dict.valueForKey("oil_wear") as String;
            item.price = dict.valueForKey("price") as String;
            item.promotion = dict.valueForKey("promotion") as String;
            item.score = dict.valueForKey("score") as String;
            item.st_id = dict.valueForKey("st_id") as String;
            item.st_name = dict.valueForKey("st_name") as String;
            item.thumbnail = dict.valueForKey("thumbnail") as String;
            item.type = dict.valueForKey("type") as String;
            item.wecarid = dict.valueForKey("wecarid") as String;
            
            stations?.append(item);
        }
//        println(stations)
    }
    
    func parseSuggestions(suggestionData: NSDictionary){
        suggestions = SuggestedStation();
//        println(suggestionData);
        // 最便宜的加油站
        var cheapDict = suggestionData.valueForKey("cheapest_station") as NSDictionary;
        suggestions?.cheapest = StationData();
        suggestions?.cheapest?.address = cheapDict.valueForKey("address") as String;
        suggestions?.cheapest?.busystatus = cheapDict.valueForKey("busystatus") as NSInteger;
        suggestions?.cheapest?.distanct = cheapDict.valueForKey("distance") as CGFloat;
        suggestions?.cheapest?.latitude = cheapDict.valueForKey("latitude") as String;
        suggestions?.cheapest?.longitude = cheapDict.valueForKey("longitude") as String;
        suggestions?.cheapest?.oil_wear = cheapDict.valueForKey("oil_wear") as String;
        suggestions?.cheapest?.price = cheapDict.valueForKey("price") as String;
        suggestions?.cheapest?.promotion = cheapDict.valueForKey("promotion") as String;
        suggestions?.cheapest?.score = cheapDict.valueForKey("score") as String;
        suggestions?.cheapest?.st_id = cheapDict.valueForKey("st_id") as String;
        suggestions?.cheapest?.st_name = cheapDict.valueForKey("st_name") as String;
        suggestions?.cheapest?.thumbnail = cheapDict.valueForKey("thumbnail") as String;
        suggestions?.cheapest?.type = cheapDict.valueForKey("type") as String;
        suggestions?.cheapest?.busyTimeStamp = cheapDict.valueForKey("busytimestamp") as String;
        
        // 推荐的加油站
        var recommendDict = suggestionData.valueForKey("recommended_station") as NSDictionary;
        suggestions?.recommend = StationData();
        suggestions?.recommend?.address = recommendDict.valueForKey("address") as String;
        suggestions?.recommend?.busystatus = recommendDict.valueForKey("busystatus") as NSInteger;
        suggestions?.recommend?.distanct = recommendDict.valueForKey("distance") as CGFloat;
        suggestions?.recommend?.latitude = recommendDict.valueForKey("latitude") as String;
        suggestions?.recommend?.longitude = recommendDict.valueForKey("longitude") as String;
        suggestions?.recommend?.oil_wear = recommendDict.valueForKey("oil_wear") as String;
        suggestions?.recommend?.price = recommendDict.valueForKey("price") as String;
        suggestions?.recommend?.promotion = recommendDict.valueForKey("promotion") as String;
        suggestions?.recommend?.score = recommendDict.valueForKey("score") as String;
        suggestions?.recommend?.st_id = recommendDict.valueForKey("st_id") as String;
        suggestions?.recommend?.st_name = recommendDict.valueForKey("st_name") as String;
        suggestions?.recommend?.thumbnail = recommendDict.valueForKey("thumbnail") as String;
        suggestions?.recommend?.type = recommendDict.valueForKey("type") as String;
        
    }
    
}

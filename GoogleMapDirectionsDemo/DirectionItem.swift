//
//  DirectionItem.swift
//  GoogleMapDirectionsDemo
//
//  Created by Kittitat Rodphotong on 11/24/2559 BE.
//  Copyright © 2559 DevGo. All rights reserved.
//

import Foundation

class DirectionItem {
    // MARK: - Varaible
    var distance: String = ""
    var duration: String = ""
    var polyline: String = ""
    
    // MARK: - Function
    func configureDirection(routes: Dictionary<String, AnyObject>) {
        let legsAr = (routes["legs"] as? Array) ?? []
        let legsDic = (legsAr.first as? Dictionary<String, AnyObject>) ?? [:]
        
        // Distance
        let distanceDic = (legsDic["distance"] as? Dictionary<String,AnyObject>) ?? [:]
        let dist = (distanceDic["text"] as? String) ?? ""
        distance = dist
        print("DIST: \(dist)")
        
        // Duration
        let durationDic = (legsDic["duration"] as? Dictionary<String,AnyObject>) ?? [:]
        let dura = (durationDic["text"] as? String) ?? ""
        duration = dura
        print("DURATION: \(duration)")
        
        // Overview Polyline
        let overviewPolyline = (routes["overview_polyline"] as? Dictionary<String,AnyObject>) ?? [:]
        let points = (overviewPolyline["points"] as? String) ?? ""
        polyline = points
        print("POINTS: \(points)")
    }
    
}

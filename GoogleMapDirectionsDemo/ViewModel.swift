//
//  ViewModel.swift
//  GoogleMapDirectionsDemo
//
//  Created by Kittitat Rodphotong on 11/23/2559 BE.
//  Copyright © 2559 DevGo. All rights reserved.
//

import Foundation

class ViewModel {
    // MARK: - Variable
    private let interactor = Interactor()
    private var direcItem = DirectionItem()
    
    // MARK: - Function
    func direction() {
        interactor.directions(complete:
                                {(response: [String: AnyObject]) in
                                    let status = (response["status"] as? String) ?? ""
                                    if status == "OK" {
                                        let routesAr = (response["routes"] as? Array) ?? []
                                        let routes = (routesAr.first as? Dictionary<String, AnyObject>) ?? [:]
                                        let item = DirectionItem()
                                        item.configureDirection(routes: routes)
                                        self.direcItem = item
                                    } else {
                                        print("Success With Error!!")
                                    }
                                }, error: {() in
                                    print("Error")
        })
    }
    
    func directionData() -> (String, String, String) {
        return (direcItem.distance, direcItem.duration, direcItem.polyline)
    }
}

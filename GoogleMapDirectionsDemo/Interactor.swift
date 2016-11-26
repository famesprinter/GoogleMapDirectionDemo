//
//  Interactor.swift
//  GoogleMapDirectionsDemo
//
//  Created by Kittitat Rodphotong on 11/23/2559 BE.
//  Copyright © 2559 DevGo. All rights reserved.
//

import Foundation
import Alamofire

class Interactor {
    func directions(complete: @escaping ([String: AnyObject]) -> (),
                    error: @escaping () -> ()) {
        let parameters: Parameters = [ "origin": "18.781595,98.976140",
                                       "destination": "18.780579,98.978672",
                                       "mode": "driving",
                                       "key": ""] // Your API Key
        let urlString = "https://maps.googleapis.com/maps/api/directions/json"
        
        Alamofire.request(urlString,
                          method: .get,
                          parameters: parameters)
            .responseJSON { response in
                if let json = response.result.value {
                    let response = json as! Dictionary<String, AnyObject>                    
                    complete(response)
                } else {
                    error()
                }
        }
    }
}

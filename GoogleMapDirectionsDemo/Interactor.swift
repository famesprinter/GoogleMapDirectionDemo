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
        let parameters: Parameters = [ "origin": "Toronto",
                                       "destination": "Montreal",
                                       "mode": "driving",
                                       "key": ""] // Your API Key
        let urlString = "https://maps.googleapis.com/maps/api/directions/json"
        
        Alamofire.request(urlString,
                          method: .get,
                          parameters: parameters)
            .responseJSON { response in
                print("REQUEST: \(response.request)")
                if let json = response.result.value {
                    let response = json as! Dictionary<String, AnyObject>
                    print(response)
//                    let header = response["header"] as! Dictionary<String, AnyObject>
//                    complete(header)
                } else {
                    error()
                }
        }
    }
}

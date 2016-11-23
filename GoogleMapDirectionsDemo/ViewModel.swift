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
    
    // MARK: - Function
    func direction() {
        interactor.directions(complete:
                                {(response: [String: AnyObject]) in
                                    print("Success")
                                }, error: {() in
                                    print("Error")
        })
    }
    
}

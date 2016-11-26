//
//  ViewController.swift
//  GoogleMapDirectionsDemo
//
//  Created by Kittitat Rodphotong on 11/23/2559 BE.
//  Copyright © 2559 DevGo. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    // MARK: - Variable
    let viewModel = ViewModel()
    let latOrigin = 18.781595
    let lngOrigin = 98.976140
    let latDest = 18.780579
    let lngDest = 98.978672

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Map Direction"
        viewModel.direction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let camera = GMSCameraPosition.camera(withLatitude: latOrigin,
                                              longitude: lngOrigin,
                                              zoom: 15)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        
        let positionOrigin = CLLocationCoordinate2DMake(latOrigin, lngOrigin)
        let markerOrigin = GMSMarker(position: positionOrigin)
        markerOrigin.title = "Location Origin"
        markerOrigin.map = mapView
        
        let positionDest = CLLocationCoordinate2DMake(latDest, lngDest)
        let markerDest = GMSMarker(position: positionDest)
        markerDest.title = "Location Destination"
        markerDest.map = mapView
    }
}


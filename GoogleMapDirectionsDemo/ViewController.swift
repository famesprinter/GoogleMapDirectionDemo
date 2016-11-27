//
//  ViewController.swift
//  GoogleMapDirectionsDemo
//
//  Created by Kittitat Rodphotong on 11/23/2559 BE.
//  Copyright © 2559 DevGo. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, ViewModelDelegate {
    // MARK: - Variable
    let viewModel = ViewModel()
    let latOrigin = 18.793865
    let lngOrigin = 98.991551
    let latDest = 18.781455
    let lngDest = 98.988334

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Map Direction"
        viewModel.configureDelegate(dg: self)
        viewModel.direction()
    }
    
    // MARK: - ViewModel Delegate
    func didDirectionSuccess() {
        createDirectionMap()
    }
    
    // MARK: - Create Direction Map
    func createDirectionMap() {
        // Create Map View
        let camera = GMSCameraPosition.camera(withLatitude: latOrigin,
                                              longitude: lngOrigin,
                                              zoom: 16)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        
        // Create Maeker
        let positionOrigin = CLLocationCoordinate2DMake(latOrigin, lngOrigin)
        let markerOrigin = GMSMarker(position: positionOrigin)
        markerOrigin.title = "Location Origin"
        markerOrigin.map = mapView
        
        let positionDest = CLLocationCoordinate2DMake(latDest, lngDest)
        let markerDest = GMSMarker(position: positionDest)
        markerDest.title = "Location Destination"
        markerDest.map = mapView
        
        // Create Routes
        let path: GMSPath = GMSPath(fromEncodedPath: viewModel.directionPolyline())!
        let routePolyline = GMSPolyline(path: path)
        routePolyline.strokeColor = UIColor.red
        routePolyline.strokeWidth = 8
        routePolyline.map = mapView
    }
}


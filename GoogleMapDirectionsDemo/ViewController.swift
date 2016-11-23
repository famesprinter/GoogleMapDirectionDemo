//
//  ViewController.swift
//  GoogleMapDirectionsDemo
//
//  Created by Kittitat Rodphotong on 11/23/2559 BE.
//  Copyright © 2559 DevGo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variable
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.direction()
    }
}


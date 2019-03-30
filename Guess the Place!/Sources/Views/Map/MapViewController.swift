//
//  MapViewController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 17/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
  
  let mapView: GMSMapView = {
    let mapView = GMSMapView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    return mapView
  }()
  
  private(set) var mapController: MapController?
  
  convenience init(mapController: MapController) {
    self.init()
    self.mapController = mapController
    self.mapController?.mapViewController = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapController?.viewDidLoad()
    addMapView()
  }
  
  private func addMapView() {
    view.addSubview(mapView)
    let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[mapView]|,V:|[mapView]|", dict: ["mapView": mapView])
    view.addConstraints(constraints)
  }
}

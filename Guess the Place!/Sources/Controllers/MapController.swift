//
//  MapController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 17/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: NSObject, Lifecycable {
  weak var mapViewController: MapViewController?
  private var locationDragged: Bool = false
  private var mapView: GMSMapView? {
    return mapViewController?.mapView
  }
  
  var mapViewMovingEnded: VoidClosure?
  var mapViewMovingStarted: VoidClosure?
  
  func viewDidLoad() {
    mapView?.delegate = self
  }
}

extension MapController: GMSMapViewDelegate {
  func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
    locationDragged = true
    mapViewMovingStarted?()
  }
  
  func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
    if locationDragged == true {
      locationDragged = false
      mapViewMovingEnded?()
    }
  }
}

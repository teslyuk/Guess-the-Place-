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
  
  private var mapView: GMSMapView? {
    return mapViewController?.mapView
  }
  
  func viewDidLoad() {
    mapView?.delegate = self
  }
}

extension MapController: GMSMapViewDelegate {
  func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
    
  }
  
  func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
    
  }
}

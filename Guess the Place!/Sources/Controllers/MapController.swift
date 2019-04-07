//
//  MapController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 17/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit
import GoogleMaps

final class MapController: NSObject, Lifecycable {
  
  weak var mapViewController: MapViewController?
  private var locationDragged: Bool = false
  
  private var mapView: GMSMapView? {
    return mapViewController?.mapView
  }
  
  var mapViewMovingEnded: VoidClosure?
  var mapViewMovingStarted: VoidClosure?
  var mapViewCoordinateTapped: ((CLLocationCoordinate2D) -> Void)?
  
  func viewDidLoad() {
    mapView?.delegate = self
  }
  
  func drawPath(from firstCoordinate: CLLocationCoordinate2D, to secondCoordinate: CLLocationCoordinate2D) {
    let path = GMSMutablePath()
    path.add(firstCoordinate)
    path.add(secondCoordinate)
    let rectangle = GMSPolyline(path: path)
    rectangle.map = mapView
  }
  
  func addMarker(at position: CLLocationCoordinate2D) {
    let marker = GMSMarker(position: position)
    marker.title = "Ваш выбор"
    marker.map = mapView
  }
  
  func clearMapView() {
    mapView?.clear()
  }
}

extension MapController: GMSMapViewDelegate {
  func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
    locationDragged = true
    mapViewMovingStarted?()
  }
  
  func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    mapViewCoordinateTapped?(coordinate)
  }
  
  func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
    if locationDragged == true {
      locationDragged = false
      mapViewMovingEnded?()
    }
  }
}

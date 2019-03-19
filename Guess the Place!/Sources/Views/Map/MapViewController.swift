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
  
  @IBOutlet weak var mapView: GMSMapView!
  
  private(set) var mapController: MapController?
  
  convenience init(mapController: MapController) {
    self.init()
    self.mapController = mapController
    self.mapController?.mapViewController = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapController?.viewDidLoad()
  }
}

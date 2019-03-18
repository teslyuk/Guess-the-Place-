//
//  PanoramaController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 14/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import GoogleMaps

class PanoramaController: NSObject, Lifecycable {
  private weak var googleService: GoogleMapsService?
  weak var viewController: PanoramaViewController?
  
  var panoramaView: GMSPanoramaView? {
    return viewController?.panoramaView
  }
  
  init(googleService: GoogleMapsService) {
    self.googleService = googleService
  }
  
  func viewDidLoad() {
    let coords = RandomCoords().value
    panoramaView?.moveNearCoordinate(coords, radius: 1500)
    observeMapControllerClosures()
  }
  
  private func observeMapControllerClosures() {
    let mapController = viewController?.mapViewController?.mapController
    
    mapController?.mapViewMovingEnded = { [unowned self] in
      self.viewController?.hideMapViewController()
    }
    
    mapController?.mapViewMovingStarted = { [unowned self] in
      self.viewController?.expandMapViewController()
    }
  }
}

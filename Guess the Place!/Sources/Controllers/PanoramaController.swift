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
  private var maxRadius: UInt = 1000
  
  var panoramaView: GMSPanoramaView? {
    return viewController?.panoramaView
  }
  
  init(googleService: GoogleMapsService) {
    self.googleService = googleService
  }
  
  func viewDidLoad() {
    let coords = RandomCoordinate().value
    panoramaView?.moveNearCoordinate(coords, radius: maxRadius)
    observeMapControllerClosures()
    addTargets()
  }
  
  private func addTargets() {
    viewController?.downArrowButton.addTarget(self, action: #selector(downArrowButtonClicked), for: .touchUpInside)
  }
  
  @objc private func downArrowButtonClicked() {
    viewController?.hideMapViewController()
  }
  
  private func observeMapControllerClosures() {
    let mapController = viewController?.mapViewController?.mapController
    
    mapController?.mapViewMovingStarted = { [unowned self] in
      self.viewController?.expandMapViewController()
    }
  }
}

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
  private let session: PlaySession = PlaySession()
  
  var panoramaView: GMSPanoramaView? {
    return viewController?.panoramaView
  }
  
  init(googleService: GoogleMapsService) {
    self.googleService = googleService
  }
  
  func viewDidLoad() {
    observeMapControllerClosures()
    addTargets()
    restartSession()
  }
  
  private func restartSession() {
    let mapController = viewController?.mapViewController?.mapController
    mapController?.clearMapView()
    let coordinate = RandomCoordinate().value
    panoramaView?.moveNearCoordinate(coordinate, radius: maxRadius)
    
    session.start(coordinate: coordinate)
  }
  
  private func addTargets() {
    viewController?.downArrowButton.addTarget(self, action: #selector(downArrowButtonClicked), for: .touchUpInside)
  }
  
  func rightBarButtonClicked() {
    restartSession()
  }
  
  @objc private func downArrowButtonClicked() {
    viewController?.hideMapViewController()
  }
  
  private func observeMapControllerClosures() {
    let mapController = viewController?.mapViewController?.mapController
    
    mapController?.mapViewMovingStarted = { [unowned self] in
      self.viewController?.expandMapViewController()
    }
    
    mapController?.mapViewCoordinateTapped = { [unowned self] (coordinate) in
      
      if let rightCoordinate = self.session.coordinate, self.session.isSessionActive {
        mapController?.drawPath(from: coordinate, to: rightCoordinate)
        mapController?.addMarker(at: coordinate)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
          let result = self.session.pick(point: coordinate)
          switch result {
          case .success(let meters):
            self.viewController?.showAlert(with: "Вы угадали!", and: "Расстояние равно \(meters) метров")
          case .failure(let meters):
            self.viewController?.showAlert(with: "Вы ошиблись", and: "Расстояние равно \(meters) метров")
          case .error:
            self.viewController?.showAlert(with: "Неизвестная ошибка", and: "Что-то пошло не так...")
          }
          self.restartSession()
        })
      }
    }
  }
}

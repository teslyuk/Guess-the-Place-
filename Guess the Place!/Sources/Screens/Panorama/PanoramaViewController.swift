//
//  PanoramaViewController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 14/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit
import GoogleMaps

class PanoramaViewController: UIViewController {

  let panoramaView: GMSPanoramaView = {
    let panoramaView = GMSPanoramaView()
    panoramaView.translatesAutoresizingMaskIntoConstraints = false
    return panoramaView
  }()

  private var mapViewController: MapViewController?
  private var controller: PanoramaController?
  private var mapViewControllerHeightConstraint: NSLayoutConstraint?
  
  convenience init(controller: PanoramaController, mapViewController: MapViewController) {
    self.init()
    self.controller = controller
    self.controller?.viewController = self
    self.mapViewController = mapViewController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    controller?.viewDidLoad()
    addPanoramaView()
    addMapViewController()
  }
  
  private func addPanoramaView() {
    view.addSubview(panoramaView)
    let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[panoramaView]|,V:|[panoramaView]", dict: ["panoramaView" : panoramaView])
    view.addConstraints(constraints)
  }
  
  private func addMapViewController() {
    guard let mapViewController = self.mapViewController else {
      return
    }
    
    guard let mapView = mapViewController.view else {
      return
    }
    addChild(mapViewController)
    
    view.addSubview(mapView)
    mapView.translatesAutoresizingMaskIntoConstraints = false
    let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[mapView]|,V:[panoramaView][mapView]|", dict: ["panoramaView" : panoramaView, "mapView" : mapView])
    mapViewControllerHeightConstraint = mapView.heightAnchor.constraint(equalToConstant: 100)
    view.addConstraints(constraints)
    mapViewControllerHeightConstraint?.isActive = true
    mapViewController.didMove(toParent: self)
  }
}

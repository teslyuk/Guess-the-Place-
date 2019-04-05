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

  // MARK: - Custom views
  let panoramaView: GMSPanoramaView = {
    let panoramaView = GMSPanoramaView()
    panoramaView.translatesAutoresizingMaskIntoConstraints = false
    return panoramaView
  }()
  
  let downArrowButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "down_arrow"), for: .normal)
    button.alpha = 0
    button.translatesAutoresizingMaskIntoConstraints = false
    button.imageView?.contentMode = .scaleAspectFit
    button.imageView?.tintColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
    return button
  }()
  //

  private(set) var mapViewController: MapViewController?
  private var controller: PanoramaController?
  private var mapViewControllerHeightConstraint: NSLayoutConstraint?
  
  // MARK: Private configuration
  private let minMapViewHeight: CGFloat = 200
  private let maxMapViewHeight: CGFloat = 500
  private let animationDuration: TimeInterval = 0.25
  //
  
  convenience init(controller: PanoramaController, mapViewController: MapViewController) {
    self.init()
    self.controller = controller
    self.controller?.viewController = self
    self.mapViewController = mapViewController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Decorator.decorate(self)
    controller?.viewDidLoad()
    addPanoramaView()
    addMapViewController()
    addDownArrowButton()
    addRightBarButton()
    setTabBarItem()
  }
  
  private func setTabBarItem() {
    let item = UITabBarItem(title: "Игра", image: #imageLiteral(resourceName: "panorama.png"), tag: 0)
    self.tabBarItem = item
  }
  
  private func addRightBarButton() {
    let rightBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonClicked))
    navigationItem.rightBarButtonItem = rightBarButton
  }
  
  @objc private func refreshButtonClicked() {
    controller?.rightBarButtonClicked()
  }
  
  private func addDownArrowButton() {
    view.addSubview(downArrowButton)
    let sizeConstant = 44
    guard let mapView = mapViewController?.view else {
      return
    }
    
    let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:[downArrowButton(\(sizeConstant))]-16-|,V:[downArrowButton(\(sizeConstant))]-16-[mapView]", dict: ["downArrowButton" : downArrowButton, "mapView" : mapView])
    view.addConstraints(constraints)
  }
  
  private func addPanoramaView() {
    view.addSubview(panoramaView)
    let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[panoramaView]|,V:|[panoramaView]", dict: ["panoramaView" : panoramaView])
    view.addConstraints(constraints)
  }
  
  func hideMapViewController() {
    UIView.animate(withDuration: animationDuration) { [unowned self] in
      self.mapViewControllerHeightConstraint?.constant = self.minMapViewHeight
      self.downArrowButton.alpha = 0
      self.view.layoutIfNeeded()
    }
  }
  
  func expandMapViewController() {
    UIView.animate(withDuration: animationDuration) { [unowned self] in
      self.mapViewControllerHeightConstraint?.constant = self.maxMapViewHeight
      self.downArrowButton.alpha = 1
      self.view.layoutIfNeeded()
    }
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
    let constraints = NSLayoutConstraint.contraints(withNewVisualFormat: "H:|[mapView]|,V:[panoramaView][mapView]|", dict: ["panoramaView": panoramaView, "mapView": mapView])
    mapViewControllerHeightConstraint = mapView.heightAnchor.constraint(equalToConstant: minMapViewHeight)
    view.addConstraints(constraints)
    mapViewControllerHeightConstraint?.isActive = true
    mapViewController.didMove(toParent: self)
  }
}

private extension PanoramaViewController {
  final class Decorator {
    private init() {}
    static func decorate(_ vc: PanoramaViewController) {
      vc.navigationItem.title = "Угадайте локацию"
      vc.navigationItem.largeTitleDisplayMode = .always
      vc.navigationController?.navigationBar.prefersLargeTitles = true
    }
  }
}

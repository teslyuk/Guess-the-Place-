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
  
  @IBOutlet weak var panoramaView: GMSPanoramaView!
  
  private var controller: PanoramaController?
  
  convenience init(controller: PanoramaController) {
    self.init()
    self.controller = controller
    self.controller?.viewController = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    controller?.viewDidLoad()
  }
}

//
//  PanoramaViewController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 14/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit

class PanoramaViewController: UIViewController {
  var controller: PanoramaController?
  
  convenience init(controller: PanoramaController) {
    self.init()
    self.controller = controller
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
}

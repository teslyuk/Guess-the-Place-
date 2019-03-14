//
//  PanoramaController.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 14/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation

class PanoramaController {
  private weak var googleService: GoogleMapsService?
  
  init(googleService: GoogleMapsService) {
    self.googleService = googleService
  }
}

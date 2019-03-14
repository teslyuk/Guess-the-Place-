//
//  GoogleMapsService.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 14/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import GoogleMaps

protocol GoogleMapsService: class {
  func register(with apiKey: String)
}

//
//  GoogleMapsServiceImplementation.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 14/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces

class GoogleMapsServiceImplementation: GoogleMapsService {
  func register(with apiKey: String) {
    GMSServices.provideAPIKey(apiKey)
    GMSPlacesClient.provideAPIKey(apiKey)
  }
}

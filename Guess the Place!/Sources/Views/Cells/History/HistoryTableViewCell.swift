//
//  HistoryTableViewCell.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 30/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit
import GoogleMaps

class HistoryTableViewCell: UITableViewCell, NibLoadable {
  
  @IBOutlet private weak var resultImageView: UIImageView!
  @IBOutlet private weak var distanceLabel: UILabel!
  @IBOutlet private weak var mapView: GMSMapView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}

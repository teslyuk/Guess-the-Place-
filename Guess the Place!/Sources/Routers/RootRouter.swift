//
//  RootRouter.swift
//  Guess the Place!
//
//  Created by Nikita Teslyuk on 14/03/2019.
//  Copyright © 2019 Tesnik. All rights reserved.
//

import UIKit

final class RootRouter {
  func root(_ window: inout UIWindow?, rootViewController: UIViewController) {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
  }
}


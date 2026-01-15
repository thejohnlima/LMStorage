//
//  Defaults.swift
//  Example
//
//  Created by John Lima on 7/3/21.
//  Copyright © 2021 thejohnlima. All rights reserved.
//

import LMStorage

struct MyDefaults: LMDefaults {
  static var suiteName: String? = "com.myApp.example"

  enum Keys: String {
    case currentUser
    case accessToken
    case haveSeenOnboarding
    case selectedMovie
  }
}

//
//  MyDefaults.swift
//  Example
//
//  Created by John Lima on 7/5/21.
//

import LMStorage

struct MyDefaults: LMDefaults {
  enum Keys: String {
    case container = "Example"
    case user = "User"
    case currentUser
    case accessToken
    case haveSeenOnboarding
  }
}

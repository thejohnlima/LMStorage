//
//  ViewController.swift
//  Example
//
//  Created by John Lima on 2/8/20.
//  Copyright © 2020 thejohnlima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let viewModel = ViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()

    testStorage()
    testDefaults()
  }

  private func testStorage() {
    // Saving user
    viewModel.saveUser()
    print("Storage - Saved:")
    print(viewModel.getUser()?.dictionary() ?? "⚠️ User not found")
    print("\n-----------------------------------------")

    // Saving secure user
    viewModel.saveSecureUser()
    print("Storage - Secure Saved:")
    print(viewModel.getSecureUser()?.dictionary() ?? "⚠️ Secure user not found")
    print("\n-----------------------------------------")
  }

  private func testDefaults() {
    MyDefaults.set(object: viewModel.userMock, key: .currentUser)
    MyDefaults.set("321abcd", forKey: .accessToken)
    MyDefaults.set(true, forKey: .haveSeenOnboarding)

    let savedUser: User? = MyDefaults.object(forKey: .currentUser)
    let token = MyDefaults.value(forKey: .accessToken) as? String
    let haveSeenOnboarding = MyDefaults.bool(forKey: .haveSeenOnboarding)

    print("\nDefaults - Saved User: \(savedUser?.dictionary() ?? [:])")
    print("Defaults - Saved Token: \(token ?? "")")
    print("Defaults - Have Seen Onboarding: \(haveSeenOnboarding)")
  }
}

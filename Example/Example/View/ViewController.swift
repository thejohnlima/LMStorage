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

    // Saving user
    viewModel.saveUser()
    print("Saved:")
    print(viewModel.getUser()?.dictionary() ?? "⚠️ User not found")

    // Delete user
    viewModel.deleteUser()
    print("\nRemoved:")
    print(viewModel.getUser()?.dictionary() ?? "⚠️ User not found")
    print("\n-----------------------------------------")

    // Saving secure user
    viewModel.saveSecureUser()
    print("Secure Saved:")
    print(viewModel.getSecureUser()?.dictionary() ?? "⚠️ Secure user not found")

    // Delete secure user
    viewModel.deleteSecureUser()
    print("\nSecure Removed:")
    print(viewModel.getSecureUser()?.dictionary() ?? "⚠️ Secure user not found")
  }
}

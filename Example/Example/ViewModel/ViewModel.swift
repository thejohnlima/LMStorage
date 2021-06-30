//
//  ViewModel.swift
//  Example
//
//  Created by John Lima on 2/8/20.
//  Copyright © 2020 thejohnlima. All rights reserved.
//

import Foundation

class ViewModel {

  let storage = UserStorage()
  let secureStorage = UserSecureStorage()

  init () {}

  func saveUser() {
    let user = User(id: "J1", name: "Yoda", age: 900)
    _ = storage.create(user)
  }

  func getUser() -> User? {
    let user = storage.getFirst()
    return user
  }

  func deleteUser() {
    _ = storage.delete()
  }

  func saveSecureUser() {
    let user = User(id: "J2", name: "Anakin", age: 22)
    _ = secureStorage.create(user)
  }

  func deleteSecureUser() {
    _ = secureStorage.delete()
  }

  func getSecureUser() -> User? {
    let user = secureStorage.getFirst()
    return user
  }
}

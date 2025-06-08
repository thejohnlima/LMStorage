//
//  UserSecureStorage.swift
//  Example
//
//  Created by John Lima on 2/8/20.
//  Copyright © 2020 thejohnlima. All rights reserved.
//

import LMStorage

struct UserSecureStorage: LMStorageProtocol {
  typealias T = User

  private let storage = LMSecureStorage<T>(with: MyDefaults.Keys.container.rawValue)

  func getFirst() -> User? {
    storage.getFirst(key: MyDefaults.Keys.user.rawValue)
  }

  func create(_ register: User) -> Bool {
    storage.create(register, key: MyDefaults.Keys.user.rawValue)
  }

  func update(_ register: User) -> Bool {
    storage.update(register, key: MyDefaults.Keys.user.rawValue)
  }

  func delete() -> Bool {
    storage.delete(key: MyDefaults.Keys.user.rawValue)
  }
}

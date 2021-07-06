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

  init() {}

  func getFirst() -> User? {
    return storage.getFirst(key: MyDefaults.Keys.user.rawValue)
  }

  func create(_ register: User) -> Bool {
    return storage.create(register, key: MyDefaults.Keys.user.rawValue)
  }

  func update(_ register: User) -> Bool {
    return storage.update(register, key: MyDefaults.Keys.user.rawValue)
  }

  func delete() -> Bool {
    return storage.delete(key: MyDefaults.Keys.user.rawValue)
  }
}

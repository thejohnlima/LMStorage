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

  private let storage = LMSecureStorage<T>(with: Key.container)

  init() {}

  func getFirst() -> User? {
    return storage.getFirst(key: Key.user)
  }

  func create(_ register: User) -> Bool {
    return storage.create(register, key: Key.user)
  }

  func update(_ register: User) -> Bool {
    return storage.update(register, key: Key.user)
  }

  func delete() -> Bool {
    return storage.delete(key: Key.user)
  }
}

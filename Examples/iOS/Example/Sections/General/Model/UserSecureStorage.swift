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

  func getFirst() -> User? {
    storage.getFirst(key: Key.user)
  }

  func create(_ register: User) -> Bool {
    storage.create(register, key: Key.user)
  }

  func update(_ register: User) -> Bool {
    storage.update(register, key: Key.user)
  }

  func delete() -> Bool {
    storage.delete(key: Key.user)
  }
}

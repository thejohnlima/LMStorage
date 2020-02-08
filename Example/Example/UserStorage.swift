//
//  UserStorage.swift
//  Example
//
//  Created by John Lima on 2/8/20.
//  Copyright © 2020 thejohnlima. All rights reserved.
//

import LMStorage

struct UserStorage: LMStorageProtocol {
  typealias T = User

  private let storage: LMAbstractStorage<T>

  init() {
    storage = LMStorage(with: Key.user)
  }

  func getFirst() -> User? {
    return storage.getFirst()
  }

  func create(_ register: User) -> Bool {
    return storage.create(register)
  }

  func update(_ register: User) -> Bool {
    return storage.update(register)
  }

  func delete() -> Bool {
    return storage.delete()
  }
}

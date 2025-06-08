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
    storage = LMStorage(with: MyDefaults.Keys.user.rawValue)
  }

  func getFirst() -> T? {
    storage.getFirst()
  }

  func create(_ register: T) -> Bool {
    storage.create(register)
  }

  func update(_ register: T) -> Bool {
    storage.update(register)
  }

  func getRegisters() -> [T] {
    storage.getRegisters()
  }

  func set(registers: [T]) -> Bool {
    storage.set(registers: registers)
  }

  func delete() -> Bool {
    storage.delete()
  }
}

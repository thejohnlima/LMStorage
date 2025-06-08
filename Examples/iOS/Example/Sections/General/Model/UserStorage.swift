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

  private let abstractStorage: LMAbstractStorage<T>

  init() {
    abstractStorage = LMStorage(with: Key.user)
  }

  func getFirst() -> T? {
    abstractStorage.getFirst()
  }

  func create(_ register: T) -> Bool {
    abstractStorage.create(register)
  }

  func update(_ register: T) -> Bool {
    abstractStorage.update(register)
  }

  func getRegisters() -> [T] {
    abstractStorage.getRegisters()
  }

  func set(registers: [T]) -> Bool {
    abstractStorage.set(registers: registers)
  }

  func delete() -> Bool {
    abstractStorage.delete()
  }
}

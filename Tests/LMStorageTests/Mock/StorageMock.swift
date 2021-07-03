//  MIT License
//
//  Copyright (c) 2020 John Lima
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

@testable import LMStorage

/// Storage Keys
struct Key {
  static let container = "LMStorage"
  static let user = "User"
}

/// User
struct User: LMCodable {
  let id: String
  let name: String
  let age: Int
}

/// Storage
struct UserStorage: LMStorageProtocol {
  typealias T = User

  // MARK: - Properties
  private let storage: LMAbstractStorage<T>

  // MARK: - Initializers
  init() {
    storage = LMStorage(with: Key.user)
  }

  // MARK: - Public Methods
  func getFirst() -> T? {
    return storage.getFirst()
  }

  func create(_ register: T) -> Bool {
    return storage.create(register)
  }

  func update(_ register: T) -> Bool {
    return storage.update(register)
  }

  func delete() -> Bool {
    return storage.delete()
  }

  func getRegisters() -> [T] {
    storage.getRegisters()
  }

  func set(registers: [T]) -> Bool {
    storage.set(registers: registers)
  }
}

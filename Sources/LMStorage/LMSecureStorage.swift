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

import Foundation
import KeychainSwift

public final class LMSecureStorage<T: LMCodable>: LMAbstractStorage<T> {

  // MARK: - Properties
  private let storage: KeychainSwift

  // MARK: - Overrides
  public override init(with key: String) {
    storage = KeychainSwift()
    super.init(with: key)
  }

  public override func getFirst(key: String? = nil) -> T? {
    let storageKey = concatKey(with: key ?? "")

    switch T.self {
    case is String.Type:
      return storage.get(storageKey) as? T
    case is Data.Type:
      return storage.getData(storageKey) as? T
    case is Bool.Type:
      return storage.getBool(storageKey) as? T
    default:
      guard let data = storage.getData(storageKey) else { return nil }
      let result = T(data)
      return result
    }
  }

  public override func create(_ register: T, key: String? = nil) -> Bool {
    let storageKey = concatKey(with: key ?? "")
    return store(register, key: storageKey)
  }
  
  public override func update(_ register: T, key: String? = nil) -> Bool {
    let storageKey = concatKey(with: key ?? "")
    return store(register, key: storageKey)
  }

  public override func delete(key: String? = nil) -> Bool {
    let storageKey = concatKey(with: key ?? "")
    return storage.delete(storageKey)
  }

  override func store(_ register: T, key: String) -> Bool {
    switch register {
    case let content as String:
      return storage.set(content, forKey: key)
    case let content as Bool:
      return storage.set(content, forKey: key)
    case let content as Data:
      return storage.set(content, forKey: key)
    default:
      guard let data = register.data() else { return false }
      return storage.set(data, forKey: key)
    }
  }
}

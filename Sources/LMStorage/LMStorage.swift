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

public class LMStorage<T: LMCodable>: LMAbstractStorage<T> {

  // MARK: - Properties
  private let storage: UserDefaults

  // MARK: - Overrides
  public override init(with key: String) {
    storage = UserDefaults.standard
    super.init(with: key)
  }

  public override func getFirst(key: String? = nil) -> T? {
    let storageKey = concatKey(with: key ?? "")
    let decoder = JSONDecoder()

    guard let data = storage.data(forKey: storageKey),
      let register = try? decoder.decode(T.self, from: data) else {
        return storage.object(forKey: storageKey) as? T
    }

    return register
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

    storage.removeObject(forKey: storageKey)
    storage.synchronize()

    return true
  }

  override func store(_ register: T, key: String) -> Bool {
    let encoder = JSONEncoder()

    guard let encoded = try? encoder.encode(register) else {
      storage.set(register, forKey: key)
      storage.synchronize()
      return true
    }

    storage.set(encoded, forKey: key)
    storage.synchronize()

    return true
  }
}

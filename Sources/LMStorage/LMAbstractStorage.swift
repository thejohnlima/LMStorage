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

public class LMAbstractStorage<T: LMCodable> {

  // MARK: - Properties
  private(set) var key: String

  // MARK: - Initializers
  public init(with key: String) {
    self.key = key
  }

  // MARK: - Internal Methods
  public func getFirst(key: String? = nil) -> T? {
    fatalError("Not implemented exception")
  }

  public func create(_ register: T, key: String? = nil) -> Bool {
    fatalError("Not implemented exception")
  }

  public func update(_ register: T, key: String? = nil) -> Bool {
    fatalError("Not implemented exception")
  }

  public func delete(key: String? = nil) -> Bool {
    fatalError("Not implemented exception")
  }

  public func getRegisters(key: String? = nil) -> [T] {
    fatalError("Not implemented exception")
  }

  public func set(registers: [T], key: String? = nil) -> Bool {
    fatalError("Not implemented exception")
  }

  func store(_ register: T, key: String) -> Bool {
    fatalError("Not implemented exception")
  }

  func concatKey(with key: String) -> String {
    if !key.isEmpty && key != self.key {
      return "\(self.key).\(key)"
    }
    return self.key
  }
}

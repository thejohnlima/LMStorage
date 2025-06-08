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

import XCTest
@testable import LMStorage

final class LMStorageTests: XCTestCase {

  // MARK: - Properties
  private var storage: UserStorage!

    static let allTests = [
    ("testSaveDataSuccess", testSaveDataSuccess),
    ("testUpdateDataSuccess", testUpdateDataSuccess),
    ("testGetDataSuccess", testGetDataSuccess)
  ]

  // MARK: - Overrides
  override func setUp() {
    super.setUp()
    storage = UserStorage()
  }

  override func tearDown() {
    _ = storage.delete()
    super.tearDown()
  }

  // MARK: - Tests Storage
  func testSaveDataSuccess() {
    let user = User(id: "1", name: "John", age: 30)
    let status = storage.create(user)
    XCTAssertTrue(status)
  }

  func testUpdateDataSuccess() {
    var user = User(id: "1", name: "John", age: 30)
    var status = storage.create(user)

    XCTAssertTrue(status)

    user = User(id: "2", name: "John", age: 1130)
    status = storage.update(user)

    XCTAssertTrue(status)
  }

  func testGetDataSuccess() {
    let user = User(id: "1", name: "John", age: 30)
    _ = storage.create(user)
    let saved = storage.getFirst()

    XCTAssertEqual(saved?.id, "1")
    XCTAssertEqual(saved?.name, "John")
    XCTAssertEqual(saved?.age, 30)
  }

  func testDeleteDataWithSuccess() {
    let user = User(id: "1", name: "John", age: 30)
    let status = storage.create(user)

    XCTAssertTrue(status)

    let deleted = storage.delete()

    XCTAssertTrue(deleted)
  }

  func testSaveArrayWithSuccess() {
    let registers: [User] = [
      User(id: "J1", name: "Yoda", age: 900),
      User(id: "J2", name: "Anakin", age: 22)
    ]

    let status = storage.set(registers: registers)

    XCTAssertTrue(status)

    let users: [User] = storage.getRegisters()

    XCTAssertEqual(users.first?.name, "Yoda")
    XCTAssertEqual(users.last?.name, "Anakin")
  }
}

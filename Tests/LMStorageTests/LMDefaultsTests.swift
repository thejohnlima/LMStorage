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

final class LMDefaultsTests: XCTestCase {

  // MARK: - Properties
  private var viewModel: ViewModelMock?

  static var allTests = [
    ("testSaveObjectDataWithSuccess", testSaveObjectDataWithSuccess)
  ]

  // MARK: - Overrides
  override func setUp() {
    super.setUp()
    viewModel = ViewModelMock()
  }

  override func tearDown() {
    viewModel = nil
    DefaultsMock.reset()
    super.tearDown()
  }

  // MARK: - Tests Storage
  func testSaveObjectDataWithSuccess() {
    let user = viewModel!.getUser()!

    DefaultsMock.set(object: user, key: .currentUser)

    let currentUser: ViewModelMock.User? = DefaultsMock.object(forKey: .currentUser)

    XCTAssertNotNil(currentUser)
    XCTAssertEqual(currentUser?.id, "123")
    XCTAssertEqual(currentUser?.name, "John")
    XCTAssertNil(currentUser?.age)
  }

  func testSaveBoolWithSuccess() {
    let haveSeenOnboarding = true

    DefaultsMock.set(haveSeenOnboarding, forKey: .haveSeenOnboarding)

    let result = DefaultsMock.bool(forKey: .haveSeenOnboarding)

    XCTAssertTrue(result)
  }

  func testSaveStringWithSuccess() {
    let token = "abc123"

    DefaultsMock.set(token, forKey: .accessToken)

    let value = DefaultsMock.value(forKey: .accessToken) as? String

    XCTAssertEqual(value, "abc123")
  }
}

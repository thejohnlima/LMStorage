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

@testable
import LMStorage
import XCTest

final class LMCodableTests: XCTestCase {

  // MARK: - Properties
  private var sign: Sign?
  private var signs: [Sign] = []

    static let allTests = [
    ("testSuccessItemLocalParse", testSuccessItemLocalParse),
    ("testSuccessItemsLocalParse", testSuccessItemsLocalParse),
    ("testParseArrayWithSuccess", testParseArrayWithSuccess)
  ]

  // MARK: - Overrides
  override func setUp() {
    super.setUp()
    sign = Sign.getItem(from: "sign", bundle: .module)
    signs = Sign.getItems(from: "signs", bundle: .module)
  }

  override func tearDown() {
    sign = nil
    signs = []
    super.tearDown()
  }

  // MARK: - Private Methods
  private var moviesData: Data? {
    if let path = Bundle.module.path(forResource: "movies", ofType: "json"),
       let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      return data
    }
    return nil
  }

  // MARK: - Test Methods
  func testSuccessItemLocalParse() {
    XCTAssertEqual(sign?.dateRange, "Aug 23 - Sep 22")
    XCTAssertEqual(sign?.currentDate, "July 11, 2021")
    XCTAssertEqual(sign?.description, "You reach a milestone of some kind today, and should be able to build on it without too much trouble. In fact, now is a really good time for you to step back and reconsider your goals and ambitions.")
    XCTAssertEqual(sign?.compatibility, "Cancer")
    XCTAssertEqual(sign?.mood, "Serious")
    XCTAssertEqual(sign?.color, "Orchid")
    XCTAssertEqual(sign?.luckyNumber, "93")
    XCTAssertEqual(sign?.luckyTime, "4pm")
  }

  func testSuccessItemsLocalParse() {
    XCTAssertEqual(signs.last?.dateRange, "Mar 21 - Apr 20")
    XCTAssertEqual(signs.last?.currentDate, "July 11, 2021")
    XCTAssertEqual(signs.last?.description, "Your social energy is potent today -- but it's best spent on those you already know fairly well. Friends and family need your attention more than strangers, anyway, so hole up at home for now.")
    XCTAssertEqual(signs.last?.compatibility, "Sagittarius")
    XCTAssertEqual(signs.last?.mood, "Thoughtful")
    XCTAssertEqual(signs.last?.color, "Teal")
    XCTAssertEqual(signs.last?.luckyNumber, "42")
    XCTAssertEqual(signs.last?.luckyTime, "4pm")
  }

  func testParseArrayWithSuccess() {
    let movies: [Movie] = moviesData!.toItems()
    XCTAssertEqual(movies.count, 2)
    XCTAssertEqual(movies.first?.title, "Black Panther")
    XCTAssertEqual(movies.last?.title, "Iron Man")
  }

  func testParseNullable() {
      let contet = ContentId(id: "Movie-ID", seriesTmdb: nil, source: "Amazon Prime")
      let dict = contet.dictionaryNullable()
      let dictionaryItens = 3
      let keys: [String] = ["id", "seriesTmdb", "source"]

      var itemsCount = 0
      dict?.forEach { key, _ in
          itemsCount += 1
          XCTAssertTrue(keys.contains { $0 == key })
      }

      XCTAssertEqual(dictionaryItens, itemsCount)
  }
}

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

/// Alias for literal dictionary
/// ```
/// // Example
/// let user: LMJSON = ["name": "John"]
/// ```
public typealias LMJSON = [String: Any]

/// Alias for literal dictionary
/// ```
/// // Example
/// let user: LMJSON = ["age": nil]
/// ```
public typealias LMJSONOptional = [String: Any?]

/// LMCodable protocol
public protocol LMCodable: Codable, Hashable {

  /// Unique identifier required for Combine
  var identifier: UUID { get }

  /// Initializer with JSON data
  /// - Parameter dictionary: JSON data
  init?(_ dictionary: LMJSON)

  /// Initializer with Data
  /// - Parameter data: Data parameter
  init?(_ data: Data)

  /// Convert object into JSON
  func dictionary() -> LMJSON?

  /// Convert object into JSON string
  func jsonString() -> String
}

extension LMCodable {
  public var identifier: UUID {
    return UUID()
  }

  public init?(_ dictionary: LMJSON) {
    do {
      let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
      let object = try JSONDecoder().decode(Self.self, from: data)
      self = object
    } catch {
      print("❌ Decode json error: \(error.localizedDescription)")
      return nil
    }
  }

  public init?(_ data: Data) {
    do {
      let decoder = JSONDecoder()
      let object = try decoder.decode(Self.self, from: data)
      self = object
    } catch {
      print("❌ Decode data error: \(error.localizedDescription)")
      return nil
    }
  }

  public func data() -> Data? {
    if let data = try? JSONEncoder().encode(self) {
      return data
    }
    return nil
  }

  public func dictionary() -> LMJSON? {
    if let jsonData = data(),
      let result = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? LMJSON {
      return result
    }
    return nil
  }

  public func jsonString() -> String {
    if let data = data(), let result = String(data: data, encoding: .utf8) {
      return result
    }
    return "{}"
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(identifier)
  }

  /// Get object from local file
  ///
  /// - Parameter file: File name
  /// - Parameter type: File type
  /// - Parameter bundle: File bundle
  /// - Returns: Object
  public static func getItem<T: LMCodable>(from file: String, type: String = "json", bundle: Bundle? = .main) -> T? {
    if let path = bundle?.path(forResource: file, ofType: type),
      let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      return try? JSONDecoder().decode(T.self, from: data)
    }
    return nil
  }

  /// Get objects from local file
  /// - Parameter file: JSON file name
  /// - Parameter type: File type
  /// - Parameter bundle: File bundle
  /// - Returns: Array of objects
  public static func getItems<T: LMCodable>(from file: String, type: String = "json", bundle: Bundle? = .main) -> [T] {
    if let path = bundle?.path(forResource: file, ofType: type),
      let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      let result = try? JSONDecoder().decode([T].self, from: data)
      return result ?? []
    }
    return []
  }

  /// Returns an optional `LMJSONOptional` if the serialization is successful; otherwise, returns `nil`.
  public func dictionaryNullable() -> LMJSONOptional? {
    if let jsonData = data(),
        let result = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? LMJSONOptional {
            return result
        }
    return nil
    }
}

extension Encodable {
  public func encodeJSON() throws -> Data {
    let encoder = JSONEncoder()
    return try encoder.encode(self)
  }
}

extension Data {
    /// Parse array of items
    /// - Returns: Array of Objects
    public func toItems<T: LMCodable>() -> [T] {
        do {
            let result = try JSONDecoder().decode([T].self, from: self)
            return result
        } catch {
            print("❌ Decode data error: \(error.localizedDescription)")
            return []
        }
    }
}

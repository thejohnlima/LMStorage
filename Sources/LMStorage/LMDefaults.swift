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

public protocol LMDefaults {
  associatedtype Keys: RawRepresentable where Keys.RawValue == String

  static func set(_ value: Any?, forKey: Keys)
  static func set(array: [Any], key: Keys)
  static func set<T: LMCodable>(array: [T], key: Keys)
  static func set<T: LMCodable>(object: T, key: Keys)
  static func objects<T: LMCodable>(forKey key: Keys) -> [T]
  static func object<T: LMCodable>(forKey key: Keys) -> T?
  static func value(forKey key: Keys) -> Any?
  static func bool(forKey key: Keys) -> Bool
  static func array(forKey key: Keys) -> [Any]?
  static func removeObject(forKey key: Keys)
  static func reset(for keys: [Keys])
  static func reset()
}

extension LMDefaults {
  // MARK: - Public Methods
  /// Sets the value of the specified default key.
  /// - Parameters:
  ///   - value: The object to store in the defaults database.
  ///   - forKey: The key with which to associate the value.
  public static func set(_ value: Any?, forKey: Keys) {
    set(data: value, forKey: forKey.rawValue)
  }

  /// Sets the value of the specified default key.
  /// - Parameters:
  ///   - array: Array to save
  ///   - key: The key with which to associate the value.
  public static func set(array: [Any], key: Keys) {
    set(data: array, forKey: key.rawValue)
  }

  /// Sets the values of the specified default key.
  /// - Parameters:
  ///   - array: Array to save
  ///   - key: The key with which to associate the value.
  public static func set<T: LMCodable>(array: [T], key: Keys) {
    guard let data = try? array.encodeJSON() else {
      print("❌ UserDefaults couldn't save the data")
      return
    }
    set(data: data, forKey: key.rawValue)
  }

  /// Sets the value of the specified default key.
  /// - Parameters:
  ///   - object: Object to save
  ///   - key: The key with which to associate the value.
  public static func set<T: LMCodable>(object: T, key: Keys) {
    guard let data = object.data() else { return }
    set(data: data, forKey: key.rawValue)
  }

  /// Returns the values for the property identified by a given key.
  /// - Parameter key: The key with which to associate the value.
  /// - Returns: The values for the property identified by key.
  public static func objects<T: LMCodable>(forKey key: Keys) -> [T] {
    guard let data = value(forKey: key.rawValue) as? Data else { return [] }
    let result = try? JSONDecoder().decode([T].self, from: data)
    return result ?? []
  }

  /// Returns the object for the property identified by a given key.
  /// - Parameter key: The key with which to associate the value.
  /// - Returns: The object for the property identified by key.
  public static func object<T: LMCodable>(forKey key: Keys) -> T? {
    guard let data = value(forKey: key.rawValue) as? Data else { return nil }
    let result = try? JSONDecoder().decode(T.self, from: data)
    return result
  }

  /// Returns the value for the property identified by a given key.
  /// - Parameter key: The key with which to associate the value.
  /// - Returns: The value for the property identified by key.
  public static func value(forKey key: Keys) -> Any? {
    value(forKey: key.rawValue)
  }

  /// Returns the bool for the property identified by a given key.
  /// - Parameter key: The key with which to associate the value.
  /// - Returns: The bool value for the property identified by key.
  public static func bool(forKey key: Keys) -> Bool {
    value(forKey: key.rawValue) as? Bool ?? false
  }

  /// Returns the array associated with the specified key.
  /// - Parameter key: A key in the current user‘s defaults database.
  /// - Returns: The array associated with the specified key, or nil if the key does not exist or its value is not an array.
  public static func array(forKey key: Keys) -> [Any]? {
    UserDefaults.standard.array(forKey: key.rawValue)
  }

  /// Remove saved object using the constants key
  /// - Parameter key: The key with which to associate the value.
  public static func removeObject(forKey key: Keys) {
    UserDefaults.standard.removeObject(forKey: key.rawValue)
  }

  /// Reset defaults for some keys
  /// - Parameter keys: Keys to reset values
  public static func reset(for keys: [Keys]) {
    let defaults = UserDefaults.standard

    keys.forEach { key in
      defaults.removeObject(forKey: key.rawValue)
    }
  }

  /// Reset defaults
  public static func reset() {
    let defaults = UserDefaults.standard
    let dictionary = defaults.dictionaryRepresentation()

    dictionary.keys.forEach { key in
      defaults.removeObject(forKey: key)
    }
  }

  // MARK: - Private Methods
  private static func value(forKey key: String) -> Any? {
    UserDefaults.standard.value(forKey: key)
  }

  private static func set(data: Any?, forKey: String) {
    UserDefaults.standard.set(data, forKey: forKey)
  }
}

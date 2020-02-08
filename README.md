<h1 align="center">LMStorage</h1>

<p align="center">
 <a href="https://github.com/thejohnlima/LMStorage/releases">
  <img src="https://img.shields.io/github/v/release/thejohnlima/LMStorage?style=for-the-badge">
 </a>
 <a href="https://github.com/thejohnlima/LMStorage/actions">
  <img src="https://img.shields.io/github/workflow/status/thejohnlima/LMStorage/CI/master?style=for-the-badge">
 </a>
 <a href="https://cocoapods.org/pods/LMStorage">
  <img src="https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=for-the-badge">
 </a>
 <a href="https://github.com/thejohnlima/LMStorage">
  <img src="https://img.shields.io/github/repo-size/thejohnlima/LMStorage.svg?style=for-the-badge">
 </a>
 <a href="https://raw.githubusercontent.com/thejohnlima/LMStorage/master/LICENSE">
  <img src="https://img.shields.io/github/license/thejohnlima/LMStorage.svg?style=for-the-badge">
 </a>
 <a href="https://developer.apple.com/ios/">
  <img src="https://img.shields.io/cocoapods/p/LMStorage?style=for-the-badge">
 </a>
 <a href="https://developer.apple.com/swift/">
  <img src="https://img.shields.io/badge/Swift-5-blue.svg?style=for-the-badge">
 </a>
</p>

💾 **LMStorage** is a framework which reduces the complexity of managing a persistent layer.

## ❗️Requirements

- iOS 9.0+
- Swift 5.0+

## ⚒ Installation

### Swift Package Manager

**LMStorage** is available through [SPM](https://developer.apple.com/videos/play/wwdc2019/408/). To install
it, follow the steps:

```script
Open Xcode project > File > Swift Packages > Add Package Dependecy
```

After that, put the url in the field: `https://github.com/thejohnlima/LMStorage.git`

### CocoaPods

**LMStorage** is available through [CocoaPods](https://cocoapods.org/pods/LMStorage). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LMStorage'
```

and run `pod install`

## 🎓 How to use

Import library in your file:

```Swift
import LMStorage
```

```swift
/// Saving user example
let user = User(id: "1", name: "John John", age: 30)
let storage = UserStorage()
storage.create(user)
```

```swift
/// Saving secure user example
let user = User(id: "2", name: "John John", age: 1130)
let secureStorage = UserSecureStorage()
secureStorage.create(user)
```

```swift
/// Storage Keys Example
struct Key {
  static let container = "LMStorage"
  static let user = "User"
}
```

```swift
/// User Example
struct User: LMCodable {
  let id: String
  let name: String
  let age: Int
}
```

```swift
/// User storage example
struct UserStorage: LMStorageProtocol {
  typealias T = User

  private let storage: LMAbstractStorage<T>

  init() {
    storage = LMStorage(with: Key.user)
  }

  func getFirst() -> User? {
    return storage.getFirst()
  }

  func create(_ register: User) -> Bool {
    return storage.create(register)
  }

  func update(_ register: User) -> Bool {
    return storage.update(register)
  }

  func delete() -> Bool {
    return storage.delete()
  }
}
```

```swift
/// User secure storage example
struct UserSecureStorage: LMStorageProtocol {
  typealias T = User

  private let storage = LMSecureStorage<T>(with: Key.container)

  init() {}

  func getFirst() -> User? {
    return storage.getFirst(key: Key.user)
  }

  func create(_ register: User) -> Bool {
    return storage.create(register, key: Key.user)
  }

  func update(_ register: User) -> Bool {
    return storage.update(register, key: Key.user)
  }

  func delete() -> Bool {
    return storage.delete(key: Key.user)
  }
}
```

If you need more examples, take a look at [`Example project`](https://github.com/thejohnlima/LMStorage/tree/master/Example).

## 🙋🏻‍ Communication

- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request. 👨🏻‍💻

## 📜 License

**LMStorage** is under MIT license. See the [LICENSE](https://raw.githubusercontent.com/thejohnlima/LMStorage/master/LICENSE?token=ALdmBr7BYPLFm0JcKkmChbVeGU10EblTks5cgHzcwA%3D%3D) file for more info.

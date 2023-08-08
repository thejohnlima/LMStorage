<h1 align="center">LMStorage</h1>

<p align="center">
 <a href="https://github.com/thejohnlima/LMStorage/releases">
  <img src="https://img.shields.io/github/v/release/thejohnlima/LMStorage?style=for-the-badge">
 </a>
 <a href="https://cocoapods.org/pods/LMStorage">
  <img src="https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=for-the-badge">
 </a><br>
 <a href="https://github.com/thejohnlima/LMStorage">
  <img src="https://img.shields.io/github/repo-size/thejohnlima/LMStorage.svg?style=for-the-badge">
 </a>
 <a href="https://developer.apple.com/ios/">
  <img src="https://img.shields.io/cocoapods/p/LMStorage?style=for-the-badge">
 </a>
 <a href="https://developer.apple.com/swift/">
  <img src="https://img.shields.io/badge/Swift-5-blue.svg?style=for-the-badge">
 </a>
 <a href="https://raw.githubusercontent.com/thejohnlima/LMStorage/master/LICENSE">
  <img src="https://img.shields.io/github/license/thejohnlima/LMStorage.svg?style=for-the-badge">
 </a>
</p>

💾 **LMStorage** is a framework which reduces the complexity of managing a persistent layer.

## ❗️Requirements

- iOS 12.1+
- tvOS 9.0+
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

## 🎓 How to use LMCodable

### Parsing a dictionary

```json
{
  "title": "Iron Man",
  "category": "action",
  "year": 2008,
  "rate": "94%",
  "image": "https://i.pinimg.com/564x/9d/e9/1e/9de91e58cfde7f05eb79e203301980ef.jpg"
}
```

```swift
import LMStorage

struct Movie: LMCodable {
  let title: String?
  let description: String?
  let category: String?
  let year: Int?
  let rate: String?
  let link: String?
  let image: String?
}
```

Parsing the JSON movie using a `Data` type returned by the request

```swift
let movie = Movie(data)
```

Parsing a local JSON file

```swift
let movie: Movie? = Movie.getItem(from: "file_name")
```

### Parsing an array

```json
[
  {
    "title": "Iron Man",
    "category": "action",
    "year": 2008,
    "rate": "94%",
    "image": "https://i.pinimg.com/564x/9d/e9/1e/9de91e58cfde7f05eb79e203301980ef.jpg"
  },
  {
    "title": "Black Panther",
    "category": "action",
    "year": 2018,
    "rate": "96%",
    "image": "https://i.pinimg.com/564x/43/cd/5b/43cd5b065b271006da5491645e0564c3.jpg"
  }
]
```

```swift
import LMStorage

struct Movie: LMCodable {
  let title: String?
  let description: String?
  let category: String?
  let year: Int?
  let rate: String?
  let link: String?
  let image: String?
}
```

Parsing the JSON movie using a `Data` type returned by the request

```swift
let data: Data = ...
let movies: [Movie] = data.toItems()
```

Parsing a local JSON file

```swift
let movies: [Movie] = Movie.getItems(from: "movies_file_name")
```

## 🎓 How to use LMDefaults

Import library in your file:

```Swift
import LMStorage
```

Create a struct for your Defaults files:

```Swift
struct MyDefaults: LMDefaults {
  enum Keys: String {
    case currentUser
    case accessToken
    case haveSeenOnboarding
  }
}
```

Than, in the view controller just save what you need:

```Swift
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    MyDefaults.set(true, forKey: .haveSeenOnboarding)

    let haveSeenOnboarding = MyDefaults.bool(forKey: .haveSeenOnboarding)

    print("Have Seen Onboarding: \(haveSeenOnboarding)")
  }
}
```

## 🎓 How to use LMStorage

Import library in your file:

```Swift
import LMStorage
```

```swift
/// Saving user example
let user = User(id: "1", name: "John", age: 30)
let storage = UserStorage()
storage.create(user)
```

```swift
/// Saving secure user example
let user = User(id: "2", name: "Test", age: 1130)
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

## ☕️ Support

<a href="https://www.buymeacoffee.com/thejohnlima" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

# LMStorage

```swift
/// Storage Keys
struct Key {
  static let container = "LMStorage"
  static let user = "User"
}
```

```swift
/// User
struct User: LMCodable {
  let id: String
  let name: String
  let age: Int
}
```

```swift
/// Storage
struct UserStorage: LMStorageProtocol {
  typealias T = User

  // MARK: - Properties
  private let storage: LMAbstractStorage<T>

  // MARK: - Initializers
  init() {
    storage = LMStorage(with: Key.user)
  }

  // MARK: - Public Methods
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
/// Secure Storage
struct UserSecureStorage: LMStorageProtocol {
  typealias T = User

  // MARK: - Properties
  private let storage = LMSecureStorage<T>(with: Key.container)

  // MARK: - Initializers
  init() {}

  // MARK: - Public Methods
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

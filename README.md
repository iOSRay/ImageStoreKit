# 📦 ImageStoreKit

ImageStoreKit is a lightweight Swift module for saving images to the file system with structured directories, thumbnail generation, metadata reporting, and background task queue support.

---

## ✅ Features

- ✅ Save `UIImage` or `Data` to disk
- ✅ Format options: `.png` / `.jpg(quality)`
- ✅ Auto-create folders by date or custom subpaths
- ✅ Get back file size, dimensions, and thumbnail preview
- ✅ Multi-threaded background task queue
- ✅ File existence checks, listing by extension or modified date

---

## 📦 Installation (Swift Package Manager)

Add this to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/iOSRay/ImageStoreKit.git", from: "1.0.0")
```

Or add via Xcode > Add Package.

---

## 📸 Usage Example

```swift
import UIKit
import ImageStoreKit

let image = UIImage(named: "sample")!

let token = ImageStore.shared.saveImageTask(
    image,
    to: "UserUploads/2025-08-02",
    format: .jpg(quality: 0.8)
) { result in
    switch result {
    case .success(let info):
        print("✅ Saved to: \(info.fullPath)")
        print("📐 Size: \(info.size), File: \(info.fileSizeInKB) KB")
        if let thumb = info.thumbnail {
            print("🖼 Thumbnail: \(thumb.size)")
        }
    case .failure(let error):
        print("❌ Failed: \(error)")
    }
}
```

---

## 📁 Directory Structure

Files will be saved under:

```
<app sandbox>/Documents/UserUploads/yyyy-MM-dd/HHmmssSSS.jpg
```

You can also provide a custom subpath instead of date-based folders.

---

## 🔁 Cancel / Queue Management

```swift
token.cancel() // Cancel a task
ImageStore.shared.cancelAll() // Cancel all
```

---

## 🧪 Unit Testing

Basic tests are provided under `ImageStoreKitTests`.


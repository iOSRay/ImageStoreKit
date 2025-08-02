// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "ImageStoreKit",
    platforms: [.iOS(.v14)],
    products: [.library(name: "ImageStoreKit", targets: ["ImageStoreKit"])],
    targets: [
        .target(name: "ImageStoreKit", dependencies: []),
        .testTarget(name: "ImageStoreKitTests", dependencies: ["ImageStoreKit"])
    ]
)

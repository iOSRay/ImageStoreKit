// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ImageStoreKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "ImageStoreKit", targets: ["ImageStoreKit"])
    ],
    targets: [
        .target(name: "ImageStoreKit"),
        .testTarget(name: "ImageStoreKitTests", dependencies: ["ImageStoreKit"])
    ]
)

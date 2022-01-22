// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TagView",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "TagView", targets: ["TagView"]),
    ],
    targets: [
        .target(name: "TagView", path: "Sources/TagView")
    ]
)

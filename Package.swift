// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PDFParser",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "PDFParser", targets: ["PDFParser"])
    ],
    targets: [
        .target(name: "PDFParser"),
        .testTarget(name: "PDFParserTests", dependencies: ["PDFParser"])
    ]
)

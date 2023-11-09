// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "SwiftFormat",
    products: [
        .executable(name: "swiftformat", targets: ["CommandLineTool"]),
        .library(name: "SwiftFormat", targets: ["SwiftFormat"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johnno1962/opaqueify.git",    .upToNextMinor(from: "1.0.19")),
    ],
    targets: [
        .target(name: "CommandLineTool", dependencies: ["SwiftFormat"], path: "CommandLineTool"),
        .target(name: "SwiftFormat", dependencies: [
            .product(name: "Opaqueifier", package: "opaqueify")], path: "Sources"),
        .testTarget(name: "SwiftFormatTests", dependencies: ["SwiftFormat"], path: "Tests"),
    ]
)

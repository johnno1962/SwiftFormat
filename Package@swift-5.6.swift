// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "SwiftFormat",
    products: [
        .executable(name: "swiftformat", targets: ["CommandLineTool"]),
        .library(name: "SwiftFormat", targets: ["SwiftFormat"]),
        .plugin(name: "SwiftFormatPlugin", targets: ["SwiftFormatPlugin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johnno1962/opaqueify.git",    .upToNextMinor(from: "1.0.19")),
    ],
    targets: [
        .executableTarget(name: "CommandLineTool", dependencies: ["SwiftFormat"], path: "CommandLineTool"),
        .target(name: "SwiftFormat", dependencies: [
            .product(name: "Opaqueifier", package: "opaqueify")], path: "Sources"),
        .testTarget(name: "SwiftFormatTests", dependencies: ["SwiftFormat"], path: "Tests"),
        .plugin(name: "SwiftFormatPlugin",
                capability: .command(
                    intent: .custom(verb: "swiftformat", description: "Formats Swift source files using SwiftFormat"),
                    permissions: [
                        .writeToPackageDirectory(reason: "This command reformats source files"),
                    ]
                ),
                dependencies: [.target(name: "CommandLineTool")]),
    ]
)

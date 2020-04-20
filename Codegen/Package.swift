// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Codegen",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Apollo", url: "https://github.com/apollographql/apollo-ios.git", .upToNextMinor(from: "0.25.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Codegen",
            dependencies: [
                .product(name: "ApolloCodegenLib", package: "Apollo"),
            ]),
        .testTarget(
            name: "CodegenTests",
            dependencies: ["Codegen"]),
    ]
)

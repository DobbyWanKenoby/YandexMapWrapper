// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to
// build this package.

import PackageDescription

let package = Package(
    name: "YandexMapPackageWrapper",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and
        // make them visible to other packages.
        .library(
            name: "YandexMapPackageWrapper",
            targets: ["YandexMapPackageWrapper"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/c-villain/YandexMapsMobile",
            .exact("4.5.0")
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a
        // module or a test suite.
        // Targets can depend on other targets in this package, and on products in
        // packages this package depends on.
        .target(name: "YandexMapPackageWrapper",
                dependencies: [
                    .product(name: "YandexMapsMobile", package: "YandexMapsMobile"),
                ],
                resources: [
                  .process("Resources"),
                ],
                linkerSettings: [
                    .linkedFramework("CoreLocation"),
                    .linkedFramework("CoreTelephony"),
                    .linkedFramework("SystemConfiguration"),
                    .linkedFramework("CoreMotion"),
                    .linkedLibrary("c++"),
                    .unsafeFlags(["-ObjC"]),
                ])
    ]
)

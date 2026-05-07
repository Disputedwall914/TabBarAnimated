// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "TabBarAnimated",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TabBarAnimated",
            targets: ["TabBarAnimated"]
        )
    ],
    targets: [
        .target(
            name: "TabBarAnimated",
            path: "TabBarAnimated",
            exclude: [
                "Products"
            ],
            resources: [
                .copy("TabBarAnimated.docc")
            ]
        )
    ]
)

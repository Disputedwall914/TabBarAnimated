# TabBarAnimated

TabBarAnimated is a lightweight Swift Package for building UIKit-backed tab bar interfaces in SwiftUI. It wraps `UITabBarController` in a SwiftUI-friendly API, so you can define each tab with a title, SF Symbol icons, and a root SwiftUI view.

## Features

- SwiftUI wrapper around `UITabBarController`
- Simple tab configuration model
- Support for separate default and selected SF Symbol icons
- Hosts any SwiftUI view inside each tab with `AnyView`
- Distributed as a Swift Package

## Requirements

- iOS 16.0+
- Swift 5.10+
- Xcode 15+

## Installation

Add TabBarAnimated to your project with Swift Package Manager.

1. Open your project in Xcode.
2. Go to **File > Add Package Dependencies**.
3. Enter the repository URL:

```text
https://github.com/Disputedwall914/TabBarAnimated.git
```

4. Add the `TabBarAnimated` library to your app target.

You can also add it directly to a `Package.swift` file:

```swift
.package(url: "https://github.com/Disputedwall914/TabBarAnimated.git", branch: "main")
```

Then add the product to your target dependencies:

```swift
.product(name: "TabBarAnimated", package: "TabBarAnimated")
```

## Quick Start

Import the package, create tab configurations, and pass them to `TabBarControllerView`.

```swift
import SwiftUI
import TabBarAnimated

struct RootView: View {
    private let tabs: [TabBarItemConfiguration] = [
        .init(
            title: "Home",
            icon: "house",
            selectedIcon: "house.fill",
            rootView: AnyView(HomeView())
        ),
        .init(
            title: "Search",
            icon: "magnifyingglass",
            selectedIcon: "magnifyingglass",
            rootView: AnyView(SearchView())
        ),
        .init(
            title: "Profile",
            icon: "person",
            selectedIcon: "person.fill",
            rootView: AnyView(ProfileView())
        )
    ]

    var body: some View {
        TabBarControllerView(tabs: tabs)
            .ignoresSafeArea(.container, edges: .bottom)
    }
}
```

## API Overview

### `TabBarControllerView`

`TabBarControllerView` is a SwiftUI view that creates and updates an underlying `UITabBarController`.

```swift
public init(tabs: [TabBarItemConfiguration])
```

The order of the `tabs` array controls the order of items in the tab bar.

### `TabBarItemConfiguration`

`TabBarItemConfiguration` describes one tab.

```swift
public init(
    title: String,
    icon: String,
    selectedIcon: String,
    rootView: AnyView
)
```

- `title`: The label shown in the tab bar.
- `icon`: The SF Symbol name used for the default state.
- `selectedIcon`: The SF Symbol name used for the selected state.
- `rootView`: The SwiftUI view displayed when the tab is active.

## Example

```swift
import SwiftUI
import TabBarAnimated

struct AppTabs: View {
    private let tabs: [TabBarItemConfiguration] = [
        .init(
            title: "Home",
            icon: "house",
            selectedIcon: "house.fill",
            rootView: AnyView(HomeView())
        ),
        .init(
            title: "Alerts",
            icon: "bell",
            selectedIcon: "bell.fill",
            rootView: AnyView(AlertsView())
        ),
        .init(
            title: "Saved",
            icon: "bookmark",
            selectedIcon: "bookmark.fill",
            rootView: AnyView(SavedView())
        )
    ]

    var body: some View {
        TabBarControllerView(tabs: tabs)
    }
}
```

## Documentation

The package includes DocC documentation under:

```text
TabBarAnimated/TabBarAnimated.docc
```

Open the package in Xcode and build documentation to view the included guides and symbol docs.

## Project Structure

```text
TabBarAnimated/
├── Package.swift
├── README.md
└── TabBarAnimated/
    ├── TabBarAnimated.swift
    └── TabBarAnimated.docc/
```

## Best Practices

- Use valid SF Symbol names for `icon` and `selectedIcon`.
- Prefer filled symbols for selected states, such as `house.fill` or `person.fill`.
- Keep each tab's root view focused on its own navigation flow.
- Use concise tab titles so labels remain readable.

## License

No license has been specified yet. Add a license file before distributing this package publicly.

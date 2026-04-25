# ``TabBarAnimated``

Build tab-based interfaces in SwiftUI with a lightweight wrapper around `UITabBarController`.

## Overview

`TabBarAnimated` exposes a small API surface built around two types:

- ``TabBarControllerView`` renders the tab bar interface.
- ``TabBarItemConfiguration`` describes each tab's title, icons, and root view.

Use the framework when you want to host multiple SwiftUI screens inside a UIKit-backed tab bar while keeping setup concise.

### Quick Start

Create an array of tab configurations and pass it to ``TabBarControllerView``:

```swift
import SwiftUI
import TabBarAnimated

struct RootView: View {
    var body: some View {
        TabBarControllerView(
            tabs: [
                TabBarItemConfiguration(
                    title: "Home",
                    icon: "house",
                    selectedIcon: "house.fill",
                    rootView: AnyView(HomeView())
                ),
                TabBarItemConfiguration(
                    title: "Profile",
                    icon: "person",
                    selectedIcon: "person.fill",
                    rootView: AnyView(ProfileView())
                )
            ]
        )
    }
}
```

### Notes

- `icon` and `selectedIcon` should be valid SF Symbol names.
- `rootView` is stored as `AnyView`, so wrap each tab's content when creating a configuration.
- The order of the array controls the order of tabs in the tab bar.

## Topics

### Essentials

- ``TabBarControllerView``
- ``TabBarItemConfiguration``

### Articles

- <doc:GettingStarted>

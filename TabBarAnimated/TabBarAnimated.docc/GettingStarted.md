# Getting Started

Set up a tab bar by defining each tab with ``TabBarItemConfiguration`` and embedding the result in ``TabBarControllerView``.

## Create the Content Views

Each tab hosts a SwiftUI view. Keep those views focused on their own screen content.

```swift
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Text("Home")
                .navigationTitle("Home")
        }
    }
}

struct SearchView: View {
    var body: some View {
        NavigationStack {
            Text("Search")
                .navigationTitle("Search")
        }
    }
}
```

## Build the Tab Configuration

Wrap each root view in `AnyView` and provide matching SF Symbols for normal and selected states.

```swift
import SwiftUI
import TabBarAnimated

struct AppTabs: View {
    private let tabs: [TabBarItemConfiguration] = [
        TabBarItemConfiguration(
            title: "Home",
            icon: "house",
            selectedIcon: "house.fill",
            rootView: AnyView(HomeView())
        ),
        TabBarItemConfiguration(
            title: "Search",
            icon: "magnifyingglass",
            selectedIcon: "magnifyingglass",
            rootView: AnyView(SearchView())
        ),
        TabBarItemConfiguration(
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

## Full Example

This example mirrors a common five-tab application layout:

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

## Best Practices

- Use short tab titles so labels remain readable.
- Prefer filled variants such as `house.fill` or `person.fill` for the selected state.
- Keep tab root views independent so each tab can manage its own navigation hierarchy.

import SwiftUI
import UIKit

/// A SwiftUI wrapper around `UITabBarController` that renders a tab-based interface from
/// a collection of tab item configurations.
public struct TabBarControllerView: UIViewControllerRepresentable {
    /// The tab definitions used to build the underlying tab bar controller.
    public let tabs: [TabBarItemConfiguration]

    /// Creates a tab bar controller view with the provided tab configurations.
    ///
    /// - Parameter tabs: The tabs to display in the tab bar, in display order.
    public init(tabs: [TabBarItemConfiguration]) {
        self.tabs = tabs
    }

    public func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = tabs.map(makeViewController)
        return tabBarController
    }

    public func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        if uiViewController.viewControllers?.count != tabs.count {
            uiViewController.viewControllers = tabs.map(makeViewController)
            return
        }

        guard let viewControllers = uiViewController.viewControllers else { return }

        for (index, configuration) in tabs.enumerated() {
            let hostingController = viewControllers[index] as? UIHostingController<AnyView>
            hostingController?.rootView = configuration.rootView
            configureTabBarItem(viewControllers[index].tabBarItem, with: configuration)
        }
    }

    private func makeViewController(for configuration: TabBarItemConfiguration) -> UIViewController {
        let hostingController = UIHostingController(rootView: configuration.rootView)
        hostingController.title = configuration.title
        configureTabBarItem(hostingController.tabBarItem, with: configuration)
        return hostingController
    }

    private func configureTabBarItem(_ item: UITabBarItem, with configuration: TabBarItemConfiguration) {
        item.title = configuration.title
        item.image = UIImage(systemName: configuration.icon)
        item.selectedImage = UIImage(systemName: configuration.selectedIcon)
    }
}

/// A single tab definition used by ``TabBarControllerView``.
public struct TabBarItemConfiguration {
    /// The title shown for the tab bar item.
    public let title: String

    /// The SF Symbol name used for the unselected tab state.
    public let icon: String

    /// The SF Symbol name used for the selected tab state.
    public let selectedIcon: String

    /// The SwiftUI view displayed when the tab is active.
    public let rootView: AnyView

    /// Creates a tab configuration.
    ///
    /// - Parameters:
    ///   - title: The title shown in the tab bar item.
    ///   - icon: The SF Symbol name for the default tab image.
    ///   - selectedIcon: The SF Symbol name for the selected tab image.
    ///   - rootView: The content view hosted inside the tab.
    public init(title: String, icon: String, selectedIcon: String, rootView: AnyView) {
        self.title = title
        self.icon = icon
        self.selectedIcon = selectedIcon
        self.rootView = rootView
    }
}

private struct FrameworkPreview: View {
    private let tabs: [TabBarItemConfiguration] = [
        .init(
            title: "",
            icon: "house",
            selectedIcon: "house.fill",
            rootView: AnyView(EmptyStateView(title: "Home"))
        ),
        .init(
            title: "",
            icon: "magnifyingglass",
            selectedIcon: "magnifyingglass",
            rootView: AnyView(EmptyStateView(title: "Search"))
        ),
        .init(
            title: "",
            icon: "bell",
            selectedIcon: "bell.fill",
            rootView: AnyView(EmptyStateView(title: "Alerts"))
        ),
        .init(
            title: "",
            icon: "bookmark",
            selectedIcon: "bookmark.fill",
            rootView: AnyView(EmptyStateView(title: "Saved"))
        ),
        .init(
            title: "",
            icon: "person",
            selectedIcon: "person.fill",
            rootView: AnyView(EmptyStateView(title: "Profile"))
        )
    ]

    var body: some View {
        TabBarControllerView(tabs: tabs)
            .ignoresSafeArea(.container, edges: .bottom)
    }
}

private struct EmptyStateView: View {
    let title: String

    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)
            Text(title)
                .font(.title2.weight(.semibold))
        }
    }
}

#Preview {
    FrameworkPreview()
}

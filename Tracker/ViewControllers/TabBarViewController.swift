import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let trackersViewController = TrackersViewController()
        let statisticsViewController = StatisticsViewController()
        viewControllers = [createNavigationController(for: trackersViewController, title: "Trackers", imageName: "Trackers"),
                           createNavigationController(for: statisticsViewController, title: "Statistics", imageName: "Stats")]

        tabBar.isTranslucent = false
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .systemBackground
    }

    private func createNavigationController(for rootViewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navigationController
    }
}





import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        viewControllers = [
            createTabViewController(for: TrackersViewController(), title: "Трекеры", imageName: "Trackers"),
            createTabViewController(for: StatisticsViewController(), title: "Статистика", imageName: "Stats")
        ]
    }

    
    private func configTabBar(){
        tabBar.backgroundColor = .systemBackground
        tabBar.isTranslucent = false
        tabBar.layer.borderWidth = 0.50
    }
    
    private func createTabViewController(for rootViewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), tag: 0)

        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 34, weight: .bold)]
        rootViewController.navigationItem.title = title

        return navigationController
    }
}

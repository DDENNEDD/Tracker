import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let trackersViewController = TrackersViewController()
        let statisticsViewController = StatisticsViewController()
        viewControllers = [createNavigationController(for: trackersViewController, title: "Трекеры", imageName: "Trackers"),
                           createNavigationController(for: statisticsViewController, title: "Статистика", imageName: "Stats")]

        tabBar.isTranslucent = false
        tabBar.tintColor = .systemBlue
        view.backgroundColor = .systemBackground
        
        let separatorHeight: CGFloat = 1
        let separator = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: separatorHeight))
        separator.backgroundColor = .systemGray
        tabBar.addSubview(separator)
        
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





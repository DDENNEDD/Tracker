import UIKit


final class TabBarViewController: UITabBarController {
    private let trackersViewControllerImage = "Trackers"
    private let trackersViewControllerTitle = "Трекеры"
    private let statisticsViewControllerImage = "Stats"
    private let statisticsViewControllerTitle = "Статистика"

    override func viewDidLoad() {
        super.viewDidLoad()
        createViewControllers()
        configTabBar()
    }
    
    private func configTabBar(){
        tabBar.isTranslucent = false
        tabBar.tintColor = .systemBlue
        view.backgroundColor = .systemBackground
        
        let separatorHeight: CGFloat = 0.5
        let separator = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: separatorHeight))
        separator.backgroundColor = .systemGray
        tabBar.addSubview(separator)
    }
    
    private func createViewControllers(){
        let trackersViewController = TrackersViewController()
        let statisticsViewController = StatisticsViewController()
        viewControllers = [createNavigationController(for: trackersViewController,
                                                      title: trackersViewControllerTitle,
                                                      imageName: trackersViewControllerImage),
                           createNavigationController(for: statisticsViewController,
                                                      title: statisticsViewControllerTitle,
                                                      imageName: statisticsViewControllerImage)]

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





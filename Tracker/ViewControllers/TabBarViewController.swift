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
        tabBar.backgroundColor = .systemBackground
        tabBar.layer.borderWidth = 0.50
    }

    private func createNavigationController(for rootViewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)

       
        navigationController.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]

        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title

        if let titleLabel = navigationController.navigationBar.subviews
            .compactMap({ $0 as? UILabel })
            .first(where: { $0.text == title }) {

    
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            let topConstraint = NSLayoutConstraint(
                item: titleLabel,
                attribute: .top,
                relatedBy: .equal,
                toItem: navigationController.navigationBar,
                attribute: .top,
                multiplier: 1.0,
                constant: 44.0
            )
            
            
            let leftMarginConstraint = NSLayoutConstraint(
                item: titleLabel,
                attribute: .leading,
                relatedBy: .equal,
                toItem: navigationController.navigationBar,
                attribute: .leading,
                multiplier: 1.0,
                constant: 16.0
            )
            
            NSLayoutConstraint.activate([topConstraint, leftMarginConstraint])
        }

        return navigationController
    }
}





import UIKit

final class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let trackersViewController = TrackersViewController()
        let statisticsViewController = StatisticsViewController()
        viewControllers = [createNavigationController(for: trackersViewController, title: "Trackers", imageName: "Trackers"),
                           createNavigationController(for: statisticsViewController, title: "Statistics", imageName: "Stats")]

        tabBar.isTranslucent = false
        tabBar.tintColor = .blue
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

final class TrackersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Трекеры"

        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController

        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTracker))
        navigationItem.leftBarButtonItem = addButton


        let currentDate = getCurrentDate()
        let dateLabel = UILabel()
        dateLabel.text = currentDate
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.textColor = .black
        dateLabel.sizeToFit()

        let dateItem = UIBarButtonItem(customView: dateLabel)
        navigationItem.rightBarButtonItem = dateItem
    }

    @objc func addTracker() {
        
    }

    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: Date())
    }
}

extension TrackersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

final class StatisticsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Статистика"
    }
}


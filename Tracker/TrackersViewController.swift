import UIKit


final class TrackersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Трекеры"

        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController

        let addNewTrackerButtonImage = UIImage(named: "AddTracker")?.withRenderingMode(.alwaysOriginal)
        let addNewTrackerButton = UIBarButtonItem(image: addNewTrackerButtonImage, style: .plain, target: self, action: #selector(addTracker))
        navigationItem.leftBarButtonItem = addNewTrackerButton

        let currentDate = getCurrentDate()
        let dateLabel = UILabel()
        dateLabel.text = currentDate
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.textColor = .black
        dateLabel.sizeToFit()

        let dateContainerView = UIView(frame: CGRect(x: 0, y: 0, width: dateLabel.bounds.width + 16, height: dateLabel.bounds.height + 8))
        dateContainerView.backgroundColor = .gray
        dateContainerView.layer.cornerRadius = 8.0
        dateContainerView.addSubview(dateLabel)

        let dateItem = UIBarButtonItem(customView: dateContainerView)
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

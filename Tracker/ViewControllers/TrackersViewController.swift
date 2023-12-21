import UIKit


final class TrackersViewController: UIViewController {
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.date = Date()
        return datePicker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configSearchController()
        newTrackerButton()
        datePickerButton()
    }

    @objc func didTapAddNewTrackerButton() {
        print("Есть Нажатие!")
    }
    
    private func configSearchController(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    private func newTrackerButton(){
        let addNewTrackerButtonImage = UIImage(named: "AddTracker")?.withRenderingMode(.alwaysOriginal)
        let addNewTrackerButton = UIBarButtonItem(image: addNewTrackerButtonImage, style: .plain, target: self, action: #selector(didTapAddNewTrackerButton))
        navigationItem.leftBarButtonItem = addNewTrackerButton
    }
    
    private func datePickerButton(){
        let datePickerButton = UIBarButtonItem(customView: datePicker)
        navigationItem.rightBarButtonItem = datePickerButton
    }
}

extension TrackersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

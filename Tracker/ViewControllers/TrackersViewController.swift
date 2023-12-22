import UIKit


final class TrackersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configSearchControllerView()
        addNewTrackerButtonView()
        datePickerView()
    }

    @objc func didTapAddNewTrackerButton() {
        print("Есть Нажатие!")
    }
    
    private func configSearchControllerView(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
    }
    
    private func addNewTrackerButtonView(){
        let addNewTrackerButtonImage = UIImage(named: "AddTracker")?.withRenderingMode(.alwaysOriginal)
        let addNewTrackerButton = UIBarButtonItem(image: addNewTrackerButtonImage, 
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(didTapAddNewTrackerButton))
        navigationItem.leftBarButtonItem = addNewTrackerButton
    }
    
    private func datePickerView(){
        let datePicker: UIDatePicker = {
            let datePicker = UIDatePicker()
            let localeID = Locale.preferredLanguages.first
            datePicker.preferredDatePickerStyle = .compact
            datePicker.datePickerMode = .date
            datePicker.locale = Locale(identifier: localeID!)
            datePicker.date = Date()
            return datePicker
        }()
        
        let datePickerView = UIBarButtonItem(customView: datePicker)
        navigationItem.rightBarButtonItem = datePickerView
    }
}

extension TrackersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

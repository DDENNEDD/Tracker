import UIKit


final class TrackersViewController: UIViewController {
    
    private var placeholderImageView: UIImageView?
    private var placeholderLabelView: UILabel?
    
    var categories: [TrackerCategory] = []
    var completedTrackers: [TrackerRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configSearchControllerView()
        addNewTrackerButtonView()
        datePickerView()
        setupPlaceholderView()
        refreshTrackersData()
    }

    @objc func didTapAddNewTrackerButton() {
        print("Есть Нажатие!")
    }
    
    private func setupPlaceholderView() {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "PlaceHolderImage")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
        
        let label = UILabel()
            label.text = "Что будем отслеживать?"
            label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)
        
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -330),
                imageView.widthAnchor.constraint(equalToConstant: 80),
                imageView.heightAnchor.constraint(equalToConstant: 80),
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ])
            placeholderImageView = imageView
            placeholderLabelView = label
            
        }

        private func updatePlaceholderVisibility(show: Bool) {
            placeholderImageView?.isHidden = !show
            placeholderLabelView?.isHidden = !show
        }
    
    func refreshTrackersData() {
        let hasData = !categories.isEmpty
            updatePlaceholderVisibility(show: !hasData)
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
            datePicker.preferredDatePickerStyle = .compact
            datePicker.datePickerMode = .date
            datePicker.locale = .current
            datePicker.date = Date()
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            return datePicker
        }()
        
        NSLayoutConstraint.activate([
                datePicker.widthAnchor.constraint(equalToConstant: 120),
                datePicker.heightAnchor.constraint(equalToConstant: 34)
            ])
        
        let datePickerView = UIBarButtonItem(customView: datePicker)
        navigationItem.rightBarButtonItem = datePickerView
    }
}

extension TrackersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


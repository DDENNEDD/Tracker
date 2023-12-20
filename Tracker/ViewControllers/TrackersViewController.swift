import UIKit

final class TrackersViewController: UIViewController {
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.date = Date()
        return datePicker
    }()
    
    private let addNewTrackerButton: UIButton = {
        let addNewTrackerButton = UIButton()
        addNewTrackerButton.setImage(UIImage(named: "AddTracker")!, for: .normal)
        addNewTrackerButton.imageView?.contentMode = .scaleToFill
        return addNewTrackerButton
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.placeholder = "Поиск"
        return searchBar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configUI()
        
                    
    }
    
    private func configUI(){
        let allViewOnScreen = [addNewTrackerButton, datePicker, searchBar]
        allViewOnScreen.forEach {view.addSubview($0)}
        allViewOnScreen.forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            addNewTrackerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            addNewTrackerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6),
            addNewTrackerButton.widthAnchor.constraint(equalToConstant: 42),
            addNewTrackerButton.heightAnchor.constraint(equalToConstant: 42),
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 49),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 136),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
            
                    
                ])
        
    }
    
    
    @objc func didTapAddNewTrackerButton() {
        
    }
    
}

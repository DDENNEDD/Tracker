import UIKit


final class StatisticsViewController: UIViewController {
    
    private var statisticsPlaceholderImageView: UIImageView?
    private var statisticsPlaceholderLabelView: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        refreshStatisticsData()
        setupStatisticsPlaceholderView()
    }
    
    private func setupStatisticsPlaceholderView() {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "StatisticsPlaceHolderImage")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
        
        let label = UILabel()
            label.text = "Анализировать пока нечего"
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
            statisticsPlaceholderImageView = imageView
            statisticsPlaceholderLabelView = label
            
        }

        private func updateStatisticsPlaceholderVisibility(show: Bool) {
            statisticsPlaceholderImageView?.isHidden = !show
            statisticsPlaceholderLabelView?.isHidden = !show
        }
    
    func refreshStatisticsData() {
            let hasData = false
            updateStatisticsPlaceholderVisibility(show: !hasData)
        }
    
    
}

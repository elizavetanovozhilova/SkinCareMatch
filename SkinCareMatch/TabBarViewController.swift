import UIKit
let products5: [Product] = [
    Product(imageName: "amalia", name: "Амалия Кремень",websiteURL: URL(string: "https://t.me/amallichinka")),
    Product(imageName: "liza", name: "Елизавета Новожилова", websiteURL: URL(string: "https://t.me/lzznm")),
    Product(imageName: "amina", name: "Амина Газизова", websiteURL: URL(string: "https://t.me/fliwoll"))
]

class TabBarViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TabBarView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TabBarView.rowHeight = 150
        TabBarView.dataSource = self
        TabBarView.delegate = self
        TabBarView.register(UITableViewCell.self, forCellReuseIdentifier: "девочки")
        navigationItem.title = "Our creators"
        navigationController?.navigationBar.prefersLargeTitles = true
        TabBarView.backgroundColor = UIColor.white
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products5.count
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "девочки", for: indexPath)
            
            let product = products5[indexPath.row]
            
            let image = UIImage(named: product.imageName)
            cell.imageView?.image = image
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = .byWordWrapping
            cell.textLabel?.text = product.name
            cell.textLabel?.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(productTapped(gesture:)))
            cell.addGestureRecognizer(tapGesture)
                return cell
        }
    @objc func productTapped(gesture: UITapGestureRecognizer) {
            if let cell = gesture.view as? UITableViewCell,
               let indexPath = TabBarView.indexPath(for: cell),
               let productURL = products5[indexPath.row].websiteURL {
                UIApplication.shared.open(productURL, options: [:], completionHandler: nil)
            }
        }

}

import UIKit
let products2: [Product] = [
    Product(imageName: "oily1", name: "COSRX salicylic acid exfoliating cleanser",websiteURL: URL(string: "https://goldapple.ru/99800200012-salicylic-acid-exfoliating-cleanser")),
    Product(imageName: "product2", name: "Очищающая пенка", websiteURL: nil),
    Product(imageName: "product3", name: "Солнцезащитный крем", websiteURL: URL(string: "https://www.example.com/suncream"))
]

class OilySkinViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewOilySkin: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewOilySkin.rowHeight = 200
        TableViewOilySkin.dataSource = self
        TableViewOilySkin.delegate = self
        TableViewOilySkin.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCellOily")
        navigationItem.title = "Oily Skin Products"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return products2.count
            }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellOily", for: indexPath)

            let product = products2[indexPath.row]

                // Загружаем картинку
            let image = UIImage(named: product.imageName)
            cell.imageView?.image = image

                // Устанавливаем текст для ячейки
            cell.textLabel?.numberOfLines = 0 // Разрешаем перенос строк
            cell.textLabel?.lineBreakMode = .byWordWrapping // Обрываем по словам
            cell.textLabel?.text = product.name
            cell.textLabel?.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(productTapped(gesture:)))
            cell.addGestureRecognizer(tapGesture)


                return cell
            }
        
        @objc func productTapped(gesture: UITapGestureRecognizer) {
                if let cell = gesture.view as? UITableViewCell,
                   let indexPath = TableViewOilySkin.indexPath(for: cell),
                   let productURL = products2[indexPath.row].websiteURL {
                    UIApplication.shared.open(productURL, options: [:], completionHandler: nil)
                }
            }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            // Ищем экземпляр экрана A в стеке навигации
            for viewController in navigationController.viewControllers {
                if let homeViewController = viewController as? HomeViewController {
                    // Нашли экран A, возвращаемся на него
                    navigationController.popToViewController(homeViewController, animated: true)
                    return
                }
            }
            
            // Если экран A не найден (возможно, он не был добавлен в стек), просто возвращаемся на предыдущий экран
            navigationController.popViewController(animated: true)
        }
    }
    
    @IBAction func AlertForOilySkin(_ sender: Any) {
        let alertController = UIAlertController(title: "Рекомендации по уходу за жирной кожей", message: """
                        Против жирного блеска и склонности к несовершенствам направлены тщательное очищение кожи и контроль выделения себума.
                        
                        /Очищение/
                        Жирная кожа не боится очищения, но с агрессивными ПАВ и спиртами стоит быть осторожнее. Они обезвоживают кожу и, как следствие, повышают выработку себума.

                        /Матирование и увлажнение/
                        Для жирной кожи идеально подойдут средства с легкой текстурой, например, гели или флюиды. В их состав включены себорегулирующие и противовоспалительные компоненты для нормализации выделения кожного сала.

                        /Дополнительный уход/
                        Жирная кожа любит глубокое очищение и отшелушивание. Используйте маски на основе глины и продукты с содержанием кислот: салициловой, гликолевой или молочной.
                        """, preferredStyle: .alert)

                        let okAction = UIAlertAction(title: "OK", style: .default)
                        alertController.addAction(okAction)

                        present(alertController, animated: true)
        
    }
}

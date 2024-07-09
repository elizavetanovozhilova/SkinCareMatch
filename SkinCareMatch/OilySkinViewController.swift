import UIKit
let products2: [Product] = [
    Product(imageName: "oily1", name: "COSRX salicylic acid exfoliating cleanser",websiteURL: URL(string: "https://goldapple.ru/99800200012-salicylic-acid-exfoliating-cleanser")),
    Product(imageName: "oily2", name: "COSRX aha/bha clarifying treatment toner", websiteURL: URL(string: "https://goldapple.ru/97560200002-aha-bha-clarifying-treatment-tonerm")),
    Product(imageName: "oily3", name: "ART & FACT niacinamide 10% + zinc 1%", websiteURL: URL(string: "https://goldapple.ru/19000039298-niacinamide-10-zinc-1-sebum-regulating-anti-acne")),
    Product(imageName: "oily4", name: "CELIMAX oil control light sunscreen ", websiteURL: URL(string: "https://goldapple.ru/19000107932-oil-control-light-sunscreen")),
    Product(imageName: "oily5", name: "NEEDLY panthenol water gel cream", websiteURL: URL(string: "https://goldapple.ru/19000114203-panthenol-water-gel-cream")),
    Product(imageName: "oily6", name: "ART & FACT lactic acid 5% + 3d hyaluronic acid 2%", websiteURL: URL(string: "https://goldapple.ru/19000039300-lactic-acid-5-3d-hyaluronic-acid-2-peeling-moisturizing")),
    Product(imageName: "oily7", name: "ORJENA vitamin c bright eye cream", websiteURL: URL(string: "https://goldapple.ru/19000018906-vitamin-c-bright-eye-cream")),
    Product(imageName: "oily8", name: "LA ROCHE-POSAY effaclar duo(+)", websiteURL: URL(string: "https://goldapple.ru/89320200003-effaclar-duo")),
    Product(imageName: "oily9", name: "BIODERMA sebium hydra moisturising replenishing care", websiteURL: URL(string: "https://goldapple.ru/89270200013-sebium-hydra-moisturising-replenishing-care")),
    Product(imageName: "oily10", name: "BIODERMA sensibio h2o", websiteURL: URL(string: "https://goldapple.ru/89270300021-sebium-h2o")),
    Product(imageName: "oily11", name: "MA:NYO tea tree herb oil", websiteURL: URL(string: "https://goldapple.ru/19000198824-tea-tree-herb-oil")),
    Product(imageName: "oily12", name: "ULTRACEUTICALS ultra r.e.d corrective serum ", websiteURL: URL(string: "https://goldapple.ru/19000256701-ultra-r-e-d-correctivel"))
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
        TableViewOilySkin.backgroundColor = UIColor.gray // Устанавливаем  цвет фона таблицы

        
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

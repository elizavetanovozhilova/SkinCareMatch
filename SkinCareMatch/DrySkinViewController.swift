import UIKit
let products: [Product] = [
    Product(imageName: "oily1", name: "COSRX salicylic acid exfoliating cleanser", websiteURL: URL(string: "https://goldapple.ru/99800200012-salicylic-acid-exfoliating-cleanser")),
    Product(imageName: "product2", name: "Очищающая пенка", websiteURL: URL(string: "https://www.example.com/gg")),
    Product(imageName: "product3", name: "Солнцезащитный крем", websiteURL: URL(string: "https://www.example.com/suncream"))
]

class DrySkinViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableViewDrySkin: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewDrySkin.rowHeight = 200
        TableViewDrySkin.dataSource = self
        TableViewDrySkin.delegate = self
        TableViewDrySkin.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCellDry")
        navigationItem.title = "Dry Skin Products"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return products.count
            }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellDry", for: indexPath)

            let product = products[indexPath.row]

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
                   let indexPath = TableViewDrySkin.indexPath(for: cell),
                   let productURL = products[indexPath.row].websiteURL {
                    UIApplication.shared.open(productURL, options: [:], completionHandler: nil)
                }
            }

    @IBAction func AlertForDrySkin(_ sender: Any) {
        let alertController = UIAlertController(title: "Рекомендации по уходу за сухой кожей", message: """
                        Основной акцент — на увлажнение и защиту гидролипидной мантии кожи
                        
                        /Очищение/
                        Чем мягче очищение — тем лучше. Наш фаворит для очищения сухой кожи — молочко. Его кремовая текстура растворяет загрязнения, не повреждая гидролипидного слоя, который у кожи сухого типа и так истончен.

                        /Увлажнение и питание/
                        Питательный крем необходим сухой коже не меньше, чем увлажняющий. Без укрепления защитного барьера она быстро теряет влагу, а этого допускать нельзя.

                        /Дополнительный уход/
                        Солнечные ванны для кожи этого типа — плохая затея. Не забывайте про головной убор и используйте солнцезащитные кремы с максимальным фактором защиты SPF 50.
                        """, preferredStyle: .alert)

                        let okAction = UIAlertAction(title: "OK", style: .default)
                        alertController.addAction(okAction)

                        present(alertController, animated: true)
    }
}

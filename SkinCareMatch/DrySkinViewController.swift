import UIKit
let products: [Product] = [
    Product(imageName: "dry1", name: "ID.AZ dermastic foaming cleanser", websiteURL: URL(string: "https://goldapple.ru/19000049908-dermastic-foaming-cleanser")),
    Product(imageName: "dry2", name: "OKOLO hedonist night retreat", websiteURL: URL(string: "https://goldapple.ru/19000200467-hedonist-night-retreat")),
    Product(imageName: "dry3", name: "MA:NYO panthetoin essence toner", websiteURL: URL(string: "https://goldapple.ru/19000198861-panthetoin-essence-toner")),
    Product(imageName: "dry4", name: "LA ROCHE-POSAY cicaplast b5 gel lavant", websiteURL: URL(string: "https://goldapple.ru/19760335448-cicaplast-b5-gel-lavant")),
    Product(imageName: "dry5", name: "CLARINS lotion tonique hydratante", websiteURL: URL(string: "https://goldapple.ru/19760334997-lotion-tonique-hydratante")),
    Product(imageName: "dry6", name: "TRUE ISLAND honey bee collagen wrinkle solution eye cream", websiteURL: URL(string: "https://goldapple.ru/19000019948-honey-bee-collagen-wrinkle-solution-eye-cream")),
    Product(imageName: "dry7", name: "OMOROVICZA illuminating moisturiser", websiteURL: URL(string: "https://goldapple.ru/15480800001-illuminating-moisturiser")),
    Product(imageName: "dry8", name: "SCINIC hyaluronic acid cream", websiteURL: URL(string: "https://goldapple.ru/19000113987-hyaluronic-acid-cream"))
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
        TableViewDrySkin.backgroundColor = UIColor.gray // Устанавливаем  цвет фона таблицы

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

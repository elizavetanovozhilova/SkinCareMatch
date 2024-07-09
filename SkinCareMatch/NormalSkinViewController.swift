import UIKit
let products4: [Product] = [
    Product(imageName: "oily1", name: "COSRX salicylic acid exfoliating cleanser", websiteURL: URL(string: "https://goldapple.ru/99800200012-salicylic-acid-exfoliating-cleanser")),
    Product(imageName: "product2", name: "Очищающая пенка", websiteURL: nil),
    Product(imageName: "product3", name: "Солнцезащитный крем", websiteURL: URL(string: "https://www.example.com/suncream"))
]

class NormalSkinViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableViewNormalSkin: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewNormalSkin.rowHeight = 200
        TableViewNormalSkin.dataSource = self
        TableViewNormalSkin.delegate = self
        TableViewNormalSkin.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCellNormal")
        navigationItem.title = "Normal Skin Products"
        navigationController?.navigationBar.prefersLargeTitles = true
        TableViewNormalSkin.backgroundColor = UIColor.gray // Устанавливаем  цвет фона таблицы

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return products4.count
            }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellNormal", for: indexPath)

            let product = products4[indexPath.row]

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
                   let indexPath = TableViewNormalSkin.indexPath(for: cell),
                   let productURL = products4[indexPath.row].websiteURL {
                    UIApplication.shared.open(productURL, options: [:], completionHandler: nil)
                }
            }
    
    @IBAction func AlertForNormalSkin(_ sender: Any) {
        let alertController = UIAlertController(title: "Рекомендации по уходу за нормальной кожей", message: """
                        Счастливым обладателям такого типа кожи нужен минимум средств. Особое внимание надо обратить на очищение и увлажнение.
                        
                        /Очищение/
                        Мы рекомендуем щадящие продукты, такие как мицеллярная вода (для демакияжа) и очищающий мусс (для умывания). Они очистят кожу от загрязнений, но не пересушат ее.

                        /Увлажнение и питание/
                        Увлажнение — залог здоровья кожи. Возьмите в привычку дважды в день использовать увлажняющий крем, а раз–два в неделю — маску.

                        /Дополнительный уход/
                        Скрабы и кислоты стимулируют обновление клеток кожи (это способствует выравниванию тона лица и появлению здорового сияния) и работают на профилактику преждевременного старения.
                        """, preferredStyle: .alert)

                        let okAction = UIAlertAction(title: "OK", style: .default)
                        alertController.addAction(okAction)

                        present(alertController, animated: true)
    }
}

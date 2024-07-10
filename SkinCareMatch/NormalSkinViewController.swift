import UIKit
let products4: [Product] = [
    Product(imageName: "norm1", name: "HOLY LAND youthful cream for normal skin", websiteURL: URL(string: "https://goldapple.ru/19000038014-youthful-cream-for-normal-to-oily-skin")),
    Product(imageName: "norm2", name: "LA ROCHE-POSAY hydraphase ha", websiteURL: URL(string: "https://goldapple.ru/19000005029-hydraphase-ha")),
    Product(imageName: "norm3", name: "ZEROID soothing", websiteURL: URL(string: "https://goldapple.ru/19000187929-soothing")),
    Product(imageName: "norm4", name: "PAYOT crème vitaminée éclat", websiteURL: URL(string: "https://goldapple.ru/19000127965-creme-vitaminee-eclat")),
    Product(imageName: "norm5", name: "EAU THERMALE AVENE hydrance legere ", websiteURL: URL(string: "https://goldapple.ru/89190500003-hydrance-optimale-legere")),
    Product(imageName: "norm6", name: "BIODERMA hydrabio light moisturizing care", websiteURL: URL(string: "https://goldapple.ru/89270500008-hydrabio-light-moisturizing-care")),
    Product(imageName: "norm7", name: "COLLA GEN cleansing foam", websiteURL: URL(string: "https://goldapple.ru/19000210029-cleansing-foam")),
    Product(imageName: "norm8", name: "DERMEDIC redness correcting day cream uv+ir spf20", websiteURL: URL(string: "https://goldapple.ru/19000111575-redness-spf20")),
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

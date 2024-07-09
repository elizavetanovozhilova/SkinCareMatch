import UIKit
let products3: [Product] = [
    Product(imageName: "oily1", name: "COSRX salicylic acid exfoliating cleanser", websiteURL: URL(string: "https://goldapple.ru/99800200012-salicylic-acid-exfoliating-cleanser")),
    Product(imageName: "product2", name: "Очищающая пенка", websiteURL: nil),
    Product(imageName: "product3", name: "Солнцезащитный крем", websiteURL: URL(string: "https://www.example.com/suncream"))
]

class CombinationSkinViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableViewCombiSkin: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewCombiSkin.rowHeight = 200
        TableViewCombiSkin.dataSource = self
        TableViewCombiSkin.delegate = self
        TableViewCombiSkin.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCellCombi")
        navigationItem.title = "Combi Skin Products"
        navigationController?.navigationBar.prefersLargeTitles = true
        TableViewCombiSkin.backgroundColor = UIColor.gray // Устанавливаем  цвет фона таблицы



    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return products3.count
            }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCellCombi", for: indexPath)

            let product = products3[indexPath.row]

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
                   let indexPath = TableViewCombiSkin.indexPath(for: cell),
                   let productURL = products3[indexPath.row].websiteURL {
                    UIApplication.shared.open(productURL, options: [:], completionHandler: nil)
                }
            }

    @IBAction func AlertForCombiSkin(_ sender: Any) {
        let alertController = UIAlertController(title: "Рекомендации по уходу за комбинированной кожей", message: """
                        Пожалуй, самый сложный и многоэтапный уход понадобится обладателям такой кожи, ведь Т-зона нуждается в матировании, а U-зона — в интенсивном увлажнении.
                        
                        /Очищение/
                        Ваш идеальный очищающий продукт — мусс для умывания. Он действует деликатно, но достаточно эффективно, чтобы справиться со всеми загрязнениями и кожным жиром.

                        /Матирование, увлажнение и питание/
                        Не бойтесь комбинировать продукты: на лоб, подбородок и Т-зону наносите легкие увлажняющие кремы или флюиды, а сухую периферию лица питайте и защищайте жирным кремом.

                        /Дополнительный уход/
                        Как и жирная кожа, комбинированная хорошо воспринимает глубокое очищение и отшелушивание. Глиняными масками очищайте поры на носу и подбородке, а с помощью скрабов и кислотных продуктов стимулируйте обновление клеток и избавляйтесь от омертвевшего рогового слоя.
                        """, preferredStyle: .alert)

                        let okAction = UIAlertAction(title: "OK", style: .default)
                        alertController.addAction(okAction)

                        present(alertController, animated: true)
    }
    
}

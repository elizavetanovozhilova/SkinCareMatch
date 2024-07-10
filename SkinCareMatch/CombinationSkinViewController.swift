import UIKit
let products3: [Product] = [
    Product(imageName: "combi1", name: "HYGGEE  all-in-one essence", websiteURL: URL(string: "https://goldapple.ru/19000001674-all-in-one-essence")),
    Product(imageName: "combi2", name: "EAU THERMALE AVENE hydrance legere", websiteURL: URL(string: "https://goldapple.ru/89190500003-hydrance-optimale-legere")),
    Product(imageName: "combi3", name: "TENZERO clear fit heartleaf toner", websiteURL: URL(string: "https://goldapple.ru/19000158947-clear-fit-heartleaf-toner")),
    Product(imageName: "combi4", name: "FRUDIA green grape", websiteURL: URL(string: "https://goldapple.ru/9410300006-green-grape")),
    Product(imageName: "combi5", name: "BISOU combination and oily skin ", websiteURL: URL(string: "https://goldapple.ru/19000079461-combination-and-oily-skin")),
    Product(imageName: "combi6", name: "SVR mat + pores sebiaclear", websiteURL: URL(string: "https://goldapple.ru/19000190341-mat-pores-sebiacleare")),
    Product(imageName: "combi7", name: "THE SKIN HOUSE natural balancing cream", websiteURL: URL(string: "https://goldapple.ru/99721000002-natural-balancing-cream")),
    Product(imageName: "combi8", name: "ONE-DAYS YOU no more blackhead blue", websiteURL: URL(string: "https://goldapple.ru/19000197075-no-more-blackhead-blue")),
    Product(imageName: "combi9", name: "BABOR refining enzyme & vitamin c cleanser", websiteURL: URL(string: "https://goldapple.ru/19000157283-refining-enzyme-vitamin-c-cleanser"))
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

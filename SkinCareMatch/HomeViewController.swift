import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var TakeTestButton: UIButton!
    
    func loadTestResult() {
            if let skinType = UserDefaults.standard.string(forKey: "skinType") {
                resultLabel.text = "Your skin type: \(skinType)"
            } else {
                resultLabel.text = "You haven't take the test yet."
                }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTestResult()
    }
    
    func intro(username: String) {
        introLabel.text = "Hi, \(username)"
    }
    
    
    @IBAction func TakeTheTest(_ sender: Any) {
        let storyboards = UIStoryboard(name: "Main", bundle: nil)
        let TestViewController = storyboards.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        TestViewController.loadViewIfNeeded()
        navigationController?.pushViewController(TestViewController, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showRandomAlert()
        loadTestResult()
    
    }
    
    func showRandomAlert() {
        let phrases = ["Массаж лица — это отличный способ поддерживать здоровье и сияние кожи","Не забудь нанести защитный крем с SPF перед выходом на улицу","Пей достаточно воды для увлажнения кожи изнутри","Уделите время утреннему уходу, чтобы ваша кожа сияла весь день","Используйте мягкий очищающий гель для нежного очищения кожи","Не трите кожу слишком сильно при вытирании лица, чтобы избежать раздражения","Применяйте увлажняющий крем для сохранения эластичности кожи","Используйте маски для лица для дополнительного ухода и питания","Удаляйте макияж перед сном, чтобы кожа могла дышать","Помните о зоне вокруг глаз — используйте специальные средства для нее","Любите и берегите свою кожу, она отражает вашу заботу о себе","Не забывай про уход за губами — используй увлажняющий бальзам или скраб","Избегай чрезмерного употребления сладкого и жирного, это может повлиять на состояние кожи","Используй средства с витамином С для придания коже сияния и защиты от вредных воздействий окружающей среды","Не забывай улыбаться — это лучшее украшение для любой девушки!"]
        let randomIndex = Int.random(in: 0..<phrases.count)
        let randomPhrases = phrases[randomIndex]
        let alertController = UIAlertController(title: "Послание на день", message: randomPhrases, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
        
    
    }
    
}



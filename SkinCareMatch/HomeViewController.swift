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
        let phrases = ["Facial massage is a great way to maintain the health and radiance of the skin", "Don't forget to apply sunscreen with SPF before going outside", "Drink enough water to moisturize your skin from the inside", "Take time for your morning skincare routine to make your skin glow all day", "Use a gentle cleansing gel for delicate skin cleansing", "Do not rub your skin too hard when drying your face to avoid irritation", "Apply moisturizer to maintain skin elasticity", "Use face masks for additional care and nutrition", "Remove makeup before bed so that your skin can breathe", "Remember the eye area - use special products for it", "Love and take care of your skin, it reflects your self-care", "Don't forget about lip care - use moisturizing balm or scrub", "Avoid excessive consumption of sweets and fats, it can affect the condition of the skin", "Use products with vitamin C to give your skin radiance and protection from harmful environmental influences", "Don't forget to smile - it's the best accessory for any girl!"]
        let randomIndex = Int.random(in: 0..<phrases.count)
        let randomPhrases = phrases[randomIndex]
        let alertController = UIAlertController(title: "The message of the day", message: randomPhrases, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
        
    
    }
    
}



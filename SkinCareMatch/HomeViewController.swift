import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var TakeTestButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

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
}

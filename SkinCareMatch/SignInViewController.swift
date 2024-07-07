import UIKit


class SignInViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning()
    }
    
    @IBAction func SignIn(_ sender: Any) {
        guard let login = LoginTextField.text, !login.isEmpty,
                      let password = PasswordTextField.text, !password.isEmpty else {
            infoLabel.text = "Fill in all the fields"
            infoLabel.textColor = .red
                    return
                }
        
        var isCorrect = false
        for user in UserManager.shared.users {
            if user.login == LoginTextField.text && user.password == PasswordTextField.text {
                isCorrect = true
                break
            }
        }
        if isCorrect {
            infoLabel.text = " "
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            HomeViewController.loadViewIfNeeded()
            navigationController?.pushViewController(HomeViewController, animated: true)
            HomeViewController.intro(username: LoginTextField.text ?? "user")
        } else {
            infoLabel.text = "Wrong data. Try again"
            infoLabel.textColor = .red
        }

    }
    
    
}

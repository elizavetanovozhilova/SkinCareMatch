import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var PasswordMatchLabel: UILabel!
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var PasswordAgainTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func SignUp(_ sender: Any) {
        guard let login = LoginTextField.text, !login.isEmpty,
                      let password = PasswordTextField.text, !password.isEmpty,
              let passwordAgain = PasswordAgainTextField.text, !passwordAgain.isEmpty else { PasswordMatchLabel.text = "Fill in all the fields"
            PasswordMatchLabel.textColor = .red
            
                    
                    return
                }
                
                if password == passwordAgain {
                    UserManager.shared.addUser(login: login, password: password)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    HomeViewController.loadViewIfNeeded()
                    navigationController?.pushViewController(HomeViewController, animated: true)
                    HomeViewController.intro(username: LoginTextField.text ?? "user")
                } else {
                    PasswordMatchLabel.text = "Passwords don't match"
                    
        }
    }
    

}

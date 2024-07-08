import UIKit

class OilySkinViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            // Ищем экземпляр экрана A в стеке навигации
            for viewController in navigationController.viewControllers {
                if let homeViewController = viewController as? HomeViewController {
                    // Нашли экран A, возвращаемся на него
                    navigationController.popToViewController(homeViewController, animated: true)
                    return
                }
            }
            
            // Если экран A не найден (возможно, он не был добавлен в стек), просто возвращаемся на предыдущий экран
            navigationController.popViewController(animated: true)
        }
        
    }
}

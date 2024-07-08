import UIKit


class TestViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var SkinTypeLabel: UILabel!

    
    var currentQuestionIndex: Int = 0
    var selectedAnswer: Int = 0
    var answers: [Int] = []
    

    
    let questions: [String] = [
        "How often does your skin get oily?",
        "How often do you get breakouts?",
        "Do you feel skin tightness after washing your face?",
        "How does your skin react to the sun?"
    ]
    
    let options: [[String]] = [
        ["Very often", "Sometimes", "Rarely", "Never"],
        ["Often", "Sometimes", "Rarely", "Never"],
        ["Yes, always", "Sometimes", "Rarely", "Never"],
        ["Burns", "Tans", "Doesn't react", "Don't know"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        loadQuestion()
    }
    
    func loadQuestion() {
        guard currentQuestionIndex < questions.count else { return }
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion
        questionLabel.numberOfLines = 2
        pickerView.reloadAllComponents()
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        answers.append(selectedAnswer)
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswer = 0
            pickerView.selectRow(0, inComponent: 0, animated: false)
            loadQuestion()
        } else {
            let skinType = calculateSkinType()
            saveTestResult(skinType: skinType)

        }
    }
    
    func calculateSkinType() -> String {
        let type = answers.reduce(0, +) / answers.count
        var skinType = ""
        
        switch type {
        case 0:
            skinType = "oily"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let OilySkinViewController = storyboard.instantiateViewController(withIdentifier: "OilySkinViewController") as! OilySkinViewController
            OilySkinViewController.loadViewIfNeeded()
            navigationController?.pushViewController(OilySkinViewController, animated: true)
        case 1:
            skinType = "combination"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let CombinationSkinViewController = storyboard.instantiateViewController(withIdentifier: "CombinationSkinViewController") as! CombinationSkinViewController
            CombinationSkinViewController.loadViewIfNeeded()
            navigationController?.pushViewController(CombinationSkinViewController, animated: true)
        case 2:
            skinType = "dry"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let DrySkinViewController = storyboard.instantiateViewController(withIdentifier: "DrySkinViewController") as! DrySkinViewController
            DrySkinViewController.loadViewIfNeeded()
            navigationController?.pushViewController(DrySkinViewController, animated: true)
        default:
            skinType = "normal"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let NormalSkinViewController = storyboard.instantiateViewController(withIdentifier: "NormalSkinViewController") as! NormalSkinViewController
            NormalSkinViewController.loadViewIfNeeded()
            navigationController?.pushViewController(NormalSkinViewController, animated: true)
        }
        
        SkinTypeLabel.text = "Your skin is \(skinType)"
        SkinTypeLabel.textColor = .purple
        return skinType
 
    }
    
    func saveTestResult(skinType: String) {
        let defaults = UserDefaults.standard
        defaults.set(skinType, forKey: "skinType")
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options[currentQuestionIndex].count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[currentQuestionIndex][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAnswer = row
    }
}

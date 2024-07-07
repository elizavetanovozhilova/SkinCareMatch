import Foundation

class UserManager: NSObject {
    static let shared = UserManager()
    
    var users = [(login: "admin", password: "admin")]
    
    private override init() {
        super.init()
        loadUsers()
    }
    
    func addUser(login: String, password: String) {
        users.append((login: login, password: password))
        saveUsers()
    }
    
    private func saveUsers() {
        let defaults = UserDefaults.standard
        defaults.set(users.map { ["login": $0.login, "password": $0.password] }, forKey: "users")
    }
    
    private func loadUsers() {
        let defaults = UserDefaults.standard
        if let savedUsers = defaults.array(forKey: "users") as? [[String: String]] {
            users = savedUsers.map { (login: $0["login"] ?? "", password: $0["password"] ?? "") }
        }
    }
}

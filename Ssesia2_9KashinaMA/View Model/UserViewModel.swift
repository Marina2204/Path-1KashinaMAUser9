//Работа с программой
// Дата 28.09.24
//Kashina Marina
//Настройка полей первого экрана подключение и проверка на условие

import Foundation
class UserViewModel: ObservableObject {
    @Published var user = UserModel(
        id: UUID(),
        fullname: "",
        phone: "",
        email: "",
        password: ""
    )
    @Published var confirmPassword: String = ""
    
    @Published var isProgress: Bool = false
    @Published var isNavigate: Bool = false
    @Published var isAuth: Bool = false
    @Published var isError: Bool = false
    //asdsadasdsad
    func signUp() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await Reposetories.instance.signUp(
                    fullname: user.fullname,
                    phone: user.phone,
                    email: user.email,
                    password: user.password
                )
                await MainActor.run {
                    self.isNavigate = true
                    self.isProgress = false
                }
            } catch {
                print("ERROR: " + error.localizedDescription)
                await MainActor.run {
                    self.isError = true
                    self.isProgress = false
                }
            }
        }
    }
    
    func signIn() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await Reposetories.instance.signIn(
                    email: user.email,
                    password: user.password
                )
                await MainActor.run {
                    self.isAuth = true
                    self.isProgress = false
                }
            } catch {
                print("ERROR: " + error.localizedDescription)
                await MainActor.run {
                    self.isError = true
                    self.isProgress = false
                }
            }
        }
    }
    
}

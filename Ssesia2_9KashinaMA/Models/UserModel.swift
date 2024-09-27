//Работа с программой
// дата 28.09.24
//Kashina Marina
//Создание полей и инициализация поля по типу данных

import Foundation
struct UserModel: Codable {
    var id: UUID
    var fullname: String
    var phone: String
    var email: String
    var password: String
}

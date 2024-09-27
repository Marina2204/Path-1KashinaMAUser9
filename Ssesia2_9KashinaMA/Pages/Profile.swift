//Работа с программой
// дата 28.09.24
//Создан экран переходящий в пустой экран как на макете с текстом home

import SwiftUI

struct Profile: View {
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        Text("Home")
    }
}

#Preview {
    Profile()
}

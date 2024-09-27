//Работа с программой
// дата 28.09.24
//Kashina Marina
//Создания чекбокса  для оп исания и работы проекта

import SwiftUI

struct MyCheckBox: View {
    @Binding var isActive: Bool
    
    var body: some View {
        
        Group {
            if isActive {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.blue)
                    .frame(width: 16, height: 16)
                    .overlay {
                        if isActive {
                            Image(systemName: "checkmark")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.accentColor, lineWidth: 2)
                    .frame(width: 16, height: 16)
            }
        }
        .onTapGesture {
            self.isActive.toggle()
        }
        
    }
}

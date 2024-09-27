//Работа с программой
// дата 28.09.24
//Kashina Marina
//Создание первого экрана  настройка его и описание его кажого поля 

import SwiftUI


struct MyTextField: View {
    
    let isSecureField: Bool
    let titleField: String
    let placeholderField: String
    @State var isSecure: Bool = false
    @Binding var text: String
    
    var body: some View {
        
        if isSecureField {
            VStack {
                Text(titleField)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                ZStack {
                    if !isSecure {
                        SecureField(placeholderField, text: $text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .padding(.trailing, 30)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    } else {
                        TextField(placeholderField, text: $text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .padding(.trailing, 30)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    }
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        HStack{
                            //Spacer()
                            Image(systemName: isSecure ? "eye" : "eye.slash")
                                .frame(alignment: .trailing)
                                .accentColor(.gray)
                                .padding(10)
                                .font(.system(size: 14))
                        }
                    }
                }
            }
        } else {
            VStack {
                Text(titleField)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                TextField(placeholderField, text: $text)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    
            }
        }
        
    }
}


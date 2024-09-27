//Работа с программой
// дата 28.09.24
//Kashina Marina
//Создание экрна верификации подтверждения пароля
import SwiftUI

struct OTPVerify: View {
    
    let OPT = Set(["2", "2", "2", "2", "2", "2"])
    @State var cube0: String = ""
    @State var cube1: String = ""
    @State var cube2: String = ""
    @State var cube3: String = ""
    @State var cube4: String = ""
    @State var cube5: String = ""
    @State var allFieldsContains: Bool = false
    //Верификация  сработает если ввести все двойки
    func checkFields() {
        var counterFields: Int = 0
        
        if cube0 == "2" {
            counterFields += 1
        }
        
        if cube1 == "2" {
            counterFields += 1
        }
        
        if cube2 == "2" {
            counterFields += 1
        }
        
        if cube3 == "2" {
            counterFields += 1
        }
        
        if cube4 == "2" {
            counterFields += 1
        }
        
        if cube5 == "2" {
            counterFields += 1
        }
        
        if counterFields == 6 {
            allFieldsContains = true
        } else {
            allFieldsContains = false
        }
        
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("OTP Verification")
                .font(.system(size: 30, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
            Text("Eter the 6 digit numbers send to your email")
                .font(.system(size: 14))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.gray)
                .padding(.bottom, 50)
            
            HStack(spacing: 25) {
                TextField("", text: $cube0)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(Color.gray)
                    .onChange(of: cube0) {
                        checkFields()
                    }
                TextField("", text: $cube1)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(Color.gray)
                    .onChange(of: cube1) {
                        checkFields()
                    }
                TextField("", text: $cube2)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(Color.gray)
                    .onChange(of: cube2) {
                        checkFields()
                    }
                TextField("", text: $cube3)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(Color.gray)
                    .onChange(of: cube3) {
                        checkFields()
                    }
                TextField("", text: $cube4)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(Color.gray)
                    .onChange(of: cube4) {
                        checkFields()
                    }
                TextField("", text: $cube5)
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(5)
                    .border(Color.gray)
                    .onChange(of: cube5) {
                        checkFields()
                    }
            }
            
            Text("If you didn't receive code, resend after 1:00")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(25)
            
            if !allFieldsContains {
                Button("Set New Password", action: {})
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(allFieldsContains ? Color.blue : Color.gray)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            } else {
                NavigationLink("Set New Password", destination: OTPVerify())
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(allFieldsContains ? Color.blue : Color.gray)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding(25)
        
    }
}

#Preview {
    OTPVerify()
}

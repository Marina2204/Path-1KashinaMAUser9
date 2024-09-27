//Работа с программой
// дата 28.09.24
//Создания экрана сброс пароля отрислвка полей настройка условий

import SwiftUI

struct ForgotPassword: View {
    
    @State var email: String = ""
    @State var currectField: Bool = false
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Forgot Password")
                .font(.system(size: 30, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
            Text("Enter your email address")
                .font(.system(size: 14))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundColor(.gray)
                .padding(.bottom, 50)
            
            
            MyTextField(isSecureField: false, titleField: "Email Address", placeholderField: "ivan@example.com", text: $email)
                .onChange(of: email) {
                    if email.isEmpty {
                        self.currectField = false
                    } else {
                        self.currectField = true
                    }
                }
            
            if email.isEmpty {
                Button("Send OTP", action: {})
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(currectField ? Color.blue : Color.gray)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            } else {
                NavigationLink("Send OTP", destination: OTPVerify())
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(currectField ? Color.blue : Color.gray)
                    .padding(.top, 50)
                    .foregroundColor(.white)
            }
            
            
            
            
            HStack {
                Text("Remember password? Back to")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                NavigationLink("Sign In", destination: Login())
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
        .padding(25)
        .navigationBarBackButtonHidden(true)
        
    }
}


#Preview {
    ForgotPassword()
}

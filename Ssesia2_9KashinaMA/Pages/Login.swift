//Работа с программой
// дата 28.09.24
//Kashina Marina
//Настройка полей для ввода данных пользователя создание экрана login

import SwiftUI

struct Login: View {
    @State var checkBoxValue: Bool = false
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        
            
            VStack {
                
                Spacer()
              
                Text("Welcome Back")
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                Text("Fill in your email and password to continue")
                    .font(.system(size: 14))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundColor(.gray)
                
                VStack {
                    MyTextField(
                        isSecureField: false,
                        titleField: "Email address",
                        placeholderField: "ivanov@example.com",
                        text: $userViewModel.user.email
                    )
                    MyTextField(
                        isSecureField: true,
                        titleField: "Password",
                        placeholderField: "********",
                        text: $userViewModel.user.password
                    )
                    HStack {
                        HStack {
                            MyCheckBox(isActive: $checkBoxValue)
                            Text("Remember password")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        NavigationLink("Forgot Password?", destination: ForgotPassword())
                            .font(.system(size: 14))
                        
                    }
                }
                .padding([.top, .bottom], 25)
                
                Spacer()
                
                NavigationLink(destination: Profile(),
                               isActive: $userViewModel.isAuth) {
                    EmptyView()
                }
                Button("Log In", action: {
                    userViewModel.signIn()
                })
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                    .background(Color.gray)
                    .foregroundColor(.white)
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    NavigationLink("Sign Up", destination: ContentView())
                        .font(.system(size: 14))
                }
                
            }
            .padding(25)
            .navigationBarBackButtonHidden(true)
        
        
    }
}


//Работа с программой
// дата 28.09.24
//Kashina Marina
//Работа с с настройкой и описанием всего проекта

import SwiftUI

struct ContentView: View {
    //rjvvtymjmjfdjgjhdfg
    
//    @State var fullname: String = ""
//    @State var phoneNumber: String = ""
//    @State var emailAddress: String = ""
//    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var checkBoxValue: Bool = false
    @State var allFieldsChecked: Bool = false
    
    @StateObject var userViewModel = UserViewModel()
    
    @State private var showingAlert = false
    
    func checkAllFields() {
        if !userViewModel.user.fullname.isEmpty && !userViewModel.user.phone.isEmpty && !userViewModel.user.email.isEmpty && checkBoxValue {
            self.allFieldsChecked = true
        } else {
            self.allFieldsChecked = false
        }
        
        if userViewModel.user.password.isEmpty || userViewModel.user.password != confirmPassword {
            self.showingAlert = true
            self.allFieldsChecked = false
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    Text("Create an acoount")
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    Text("Complete the sign up proccess to get started")
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                }
                .padding(25)
                VStack(spacing: 25) {
                    MyTextField(
                        isSecureField: false,
                        titleField: "Full name",
                        placeholderField: "Ivan Ivanov",
                        text: $userViewModel.user.fullname
                    )
                    MyTextField(
                        isSecureField: false,
                        titleField: "Phone number",
                        placeholderField: "+7 (999) 999-99-99",
                        text: $userViewModel.user.phone
                    )
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
                    MyTextField(
                        isSecureField: true,
                        titleField: "Confirm password",
                        placeholderField: "********",
                        text: $confirmPassword
                    )
                }
                .padding(25)
                HStack {
                    MyCheckBox(isActive: $checkBoxValue)
                    Text("By ticking this box, you agree to our Terms and conditions and private policy")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .padding(25)
                
                if allFieldsChecked {
                    NavigationLink(destination: Login(),
                                   isActive: $userViewModel.isNavigate) {
                        EmptyView()
                    }
                    Button("Sign Up", action: {
                        userViewModel.signUp()
                    })
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(allFieldsChecked ? Color.blue : Color.gray)
                        .padding([.leading, .trailing], 25)
                        .foregroundColor(.white)
                } else {
                    Button("Sign Up", action: {
                        checkAllFields()
                    })
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Пароли не совпадают"),
                                message: Text("Убедитесь, что пароли введены верно"),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                        .font(.system(size: 16, weight: .bold))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .background(allFieldsChecked ? Color.blue : Color.gray)
                        .padding([.leading, .trailing], 25)
                        .foregroundColor(.white)
                }
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    NavigationLink("Sign in", destination: Login())
                        .font(.system(size: 14))
                }
            }
            .padding(5)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}

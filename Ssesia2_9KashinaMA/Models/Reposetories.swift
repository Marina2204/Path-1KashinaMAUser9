///Работа с программой
// дата 28.09.24
//Kashina Marina
// Работа с подключением базы данных пользователя добавление нового пользователя
//

import Foundation
import Supabase

class Reposetories {
    
    static let instance = Reposetories()
    
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://jdgczxbmiudgpbsoxkhy.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpkZ2N6eGJtaXVkZ3Bic294a2h5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjcyMzA1MDksImV4cCI6MjA0MjgwNjUwOX0.4Y-AJIDHaxdB1BQTXUu2GpcDPcpFQ4rTYBydJ7uEE1c",
        options: .init()
    )
    
    func signUp(
        fullname: String, phone: String, email: String, password: String
    ) async throws {
        try await supabase.auth.signUp(email: email, password: password)
        
        let user = try await supabase.auth.session.user
        
        let newUser = UserModel(
            id: user.id,
            fullname: fullname,
            phone: phone,
            email: email,
            password: password
        )
        
        try await supabase.from("users")
            .insert(newUser)
            .execute()
        
        try await supabase.auth.signOut()
    }
    
    func signIn(
        email: String, password: String
    ) async throws {
        try await supabase.auth.signIn(email: email, password: password)
    }
    
    func logOut() async throws {
        try await supabase.auth.signOut()
    }
}

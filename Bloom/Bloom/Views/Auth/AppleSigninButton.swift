//
//  AppleSigninButton.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI
import AuthenticationServices

struct AppleSigninButton: View {
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Apple Login Successful")
                    switch authResults.credential {
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                        // 계정 정보 가져오기
                        let userIdentifier = appleIDCredential.user
                        let fullName = appleIDCredential.fullName
                        let name = (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                        let email = appleIDCredential.email ?? ""

                        // UserDefaults에 계정 정보 저장
                        UserDefaults.standard.set(userIdentifier, forKey: "userIdentifier")
                        UserDefaults.standard.set(name, forKey: "userName")
                        UserDefaults.standard.set(email, forKey: "userEmail")
                        
                        UserDefaults.standard.set(true, forKey: "isAuthenticated")
                        isAuthenticated = true

                        // 백엔드에 로그인 요청
//                        loginApple(userIdentifier: userIdentifier, email: email, name: name)
                        
                    default:
                        break
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
                }
            }
        )
        .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
        .cornerRadius(5)
    }
    
    func loginApple(userIdentifier: String, email: String, name: String) {
        let loginInfo = User(userIdentifier: userIdentifier, email: email, name: name)
        
        guard let url = URL(string: "엔드포인트") else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONEncoder().encode(loginInfo)
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            print("Failed to encode login info: \(error.localizedDescription)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response from server")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                print("User received: \(user.name)")
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "isAuthenticated")
                    isAuthenticated = true
                }
            } catch {
                print("Failed to decode user: \(error.localizedDescription)")
            }
        }.resume()
    }
}

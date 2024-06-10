//
//  LoginView.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @Binding var isAuthenticated: Bool
    @State private var showAppleSigninButton = false
    
    var body: some View {
        VStack {
            Image("bloom-logo-icon")
                .resizable()
                .frame(width: 111.09, height: 111.19)
                .padding(.top, 200)
            
            Text("Bloom")
                .font(.pretendardBold(size: 35))
                .foregroundStyle(Color.pointOrange)
            
            Spacer()
            
            if showAppleSigninButton {
                AppleSigninButton(isAuthenticated: $isAuthenticated)
                    .transition(.opacity)
                    .animation(.easeIn, value: showAppleSigninButton)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.baseYellow)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    showAppleSigninButton = true
                }
            }
        }
    }
}

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
                        let identityToken = String(data: appleIDCredential.identityToken ?? Data(), encoding: .utf8) ?? ""
                        let authorizationCode = String(data: appleIDCredential.authorizationCode ?? Data(), encoding: .utf8) ?? ""
                        
                        // UserDefaults에 계정 정보 저장
                        UserDefaults.standard.set(userIdentifier, forKey: "userIdentifier")
                        UserDefaults.standard.set(name, forKey: "userName")
                        UserDefaults.standard.set(email, forKey: "userEmail")
                        UserDefaults.standard.set(identityToken, forKey: "identityToken")
                        UserDefaults.standard.set(authorizationCode, forKey: "authorizationCode")
                        UserDefaults.standard.set(true, forKey: "isAuthenticated")
                        
                        // 로그인 성공 시 상태 업데이트
                        DispatchQueue.main.async {
                            isAuthenticated = true
                        }
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
}

#Preview {
    LoginView(isAuthenticated: .constant(false))
}

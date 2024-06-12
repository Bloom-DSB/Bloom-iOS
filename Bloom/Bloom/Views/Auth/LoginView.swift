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
    @StateObject private var appleLoginViewModel = LoginViewModel()
    
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

#Preview {
    LoginView(isAuthenticated: .constant(false))
}

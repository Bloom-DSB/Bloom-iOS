//
//  LoginViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/11/24.
//

import Foundation
import SwiftUI
import AuthenticationServices
import Combine

struct AppleLoginView: Codable {
    var token: String?
}

class LoginViewModel: NSObject, ObservableObject {
    @Published var isAuthenticated: Bool = false
    private var loginCancellables = Set<AnyCancellable>()
    
    var appleLoginInfo = AppleLoginView()
    
    func loginApple() {
        // 애플 로그인 요청 시 사용되는 요청 객체
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        // 인증 요청 컨트롤러 생성
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    func insertAppleIdTokenToAppleLoginInfoModel(appleIdToken: String) {
        appleLoginInfo.token = appleIdToken
        if appleLoginInfo.token != nil {
            print(appleLoginInfo.token!)
            requestAppleLoginToServer(appleLoginInfo: appleLoginInfo)
                .sink(receiveCompletion: { result in
                    switch result {
                    case .failure(let error):
                        print("애플 로그인 비동기 error: \(error)")
                    case .finished:
                        print("애플 로그인 비동기 종료")
                    }
                }, receiveValue: { user in
                    print(user.name)
                    UserDefaults.standard.set(user.name, forKey: "userName")
                    UserDefaults.standard.set(user.email, forKey: "userEmail")
                    UserDefaults.standard.set(true, forKey: "isAuthenticated")
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                })
                .store(in: &loginCancellables)
        }
    }
    
    func requestAppleLoginToServer(appleLoginInfo: AppleLoginView) -> Future<User, Error> {
        return Future { promise in
            // 무조건 성공으로 가정
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                let user = User(id: "1111", name: "Dummy User", email: "dana@email.com") // 서버에서 받은 사용자 정보를 가정
//                promise(.success(user))
//            }
        }
        return Future { promise in
            guard let url = URL(string: "{엔드 포인트}") else {
                fatalError("Invalid URL")
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            do {
                let jsonData = try JSONEncoder().encode(appleLoginInfo)
                request.httpBody = jsonData
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                promise(.failure(error))
                return
            }
            
            URLSession.shared.dataTaskPublisher(for: request)
                .subscribe(on: DispatchQueue.global(qos: .background))
                .receive(on: DispatchQueue.main)
                .tryMap { data, response -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return data
                }
                .decode(type: User.self, decoder: JSONDecoder())
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        promise(.failure(error))
                    case .finished:
                        break
                    }
                }, receiveValue: { user in
                    promise(.success(user))
                })
                .store(in: &self.loginCancellables)
        }
    }
}

//ASAuthorizationControllerDelegate 프로토콜 구현
extension LoginViewModel: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            if let identityToken = appleIDCredential.identityToken {
                let appleIdToken = String(decoding: identityToken, as: UTF8.self)
                insertAppleIdTokenToAppleLoginInfoModel(appleIdToken: appleIdToken)
                print("\(appleIDCredential.user)의 인증서 발급 성공!")
            }
        }
    }
}

extension LoginViewModel: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let window = UIApplication.shared.windows.first else {
            fatalError("No window found")
        }
        
        return window
    }
}

//
//  MyPageView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI

struct MyPageView: View {
    @State private var userName: String = UserDefaults.standard.string(forKey: "userName") ?? "Unknown"
    @State private var email: String = UserDefaults.standard.string(forKey: "userEmail") ?? "unknown@example.com"
    @State private var storeCount = 3
    @State private var productCount = 12
    @Binding var hideTabBar: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("내 정보")
                .font(.pretendardMedium(size: 18))
                .padding([.top, .leading, .trailing])
                .frame(maxWidth: .infinity, alignment: .center)
            
            VStack(alignment: .leading) {
                HStack {
                    Image("bloom-icon")
                        .frame(width: 21)
                    
                    Text(userName)
                        .font(.pretendardExtraBold(size: 22))
                        .padding(.horizontal, 5)
                    
                    NavigationLink(destination: ProfileEditView(initialUserName: $userName, email: $email, hideTabBar: $hideTabBar)) {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color.gray4)
                    }
                }
                
                Text(email)
                    .font(.pretendardMedium(size: 14))
                    .foregroundStyle(Color.gray4)
            }
            .padding(.vertical, 20)
            
            HStack(spacing: 0) {
                NavigationLink(destination: FavoriteMarketsView()) {
                    VStack {
                        Text("관심 마켓")
                            .font(.pretendardMedium(size: 14))
                            .foregroundStyle(Color.black)
                            .padding(.bottom, 1)
                        
                        Text("\(storeCount)")
                            .font(.pretendardSemiBold(size: 24))
                            .foregroundStyle(Color.pointOrange)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Rectangle()
                    .frame(width: 0.8, height: 48)
                    .foregroundStyle(Color.pointOrange)
                
                NavigationLink(destination: FavoriteProductsView()) {
                    VStack {
                        Text("관심 상품")
                            .font(.pretendardMedium(size: 14))
                            .foregroundStyle(Color.black)
                            .padding(.bottom, 1)
                        
                        Text("\(productCount)")
                            .font(.pretendardSemiBold(size: 24))
                            .foregroundStyle(Color.pointOrange)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 107)
            .background(Color.baseYellow)
            .cornerRadius(8)
            .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                Text("기타")
                    .font(.pretendardSemiBold(size: 16))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 5)
                
                Rectangle()
                    .foregroundStyle(Color.gray5)
                    .frame(width: .infinity, height: 1)
                
                NavigationLink(destination: AppIntroPage()) {
                    Image("appintro-icon")
                        .padding(.leading, 5)
                    Text("앱 소개")
                        .font(.pretendardMedium(size: 14))
                        .foregroundStyle(Color.gray3)
                        .padding(.leading, 5)
                }
                .padding(.vertical, 12)
                
                Rectangle()
                    .foregroundStyle(Color.gray5)
                    .frame(width: .infinity, height: 1)
                
                NavigationLink(destination: OpensourceLicensePage()) {
                    Image("opensource-icon")
                        .padding(.leading, 5)
                    Text("오픈소스 라이센스")
                        .font(.pretendardMedium(size: 14))
                        .foregroundStyle(Color.gray3)
                        .padding(.leading, 5)
                }
                .padding(.vertical, 12)
                
                Rectangle()
                    .foregroundStyle(Color.gray5)
                    .frame(width: .infinity, height: 1)
                
                NavigationLink(destination: DeveloperIntroPage()) {
                    Image("developer-icon")
                        .padding(.leading, 5)
                    Text("개발자 정보")
                        .font(.pretendardMedium(size: 14))
                        .foregroundStyle(Color.gray3)
                        .padding(.leading, 5)
                }
                .padding(.vertical, 12)
                
                Rectangle()
                    .foregroundStyle(Color.gray5)
                    .frame(width: .infinity, height: 1)
            }
            .foregroundStyle(Color.black)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

#Preview {
    MyPageView(hideTabBar: .constant(false))
}

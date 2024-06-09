//
//  ProfileEditView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI

struct ProfileEditView: View {
    @Binding var initialUserName: String
    @State private var userName: String
    @Binding var email: String
    
    init(initialUserName: Binding<String>, email: Binding<String>) {
        self._initialUserName = initialUserName
        self._userName = State(initialValue: initialUserName.wrappedValue)
        self._email = email
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // 뒤로 가기 액션
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 9, height: 18)
                }
                
                Spacer()
                
                Text("프로필 수정")
                    .font(.pretendardMedium(size: 18))
                    
                Spacer()
            }
            .padding(.vertical, 15)
            
            VStack(alignment: .leading) {
                Text("닉네임")
                    .font(.pretendardSemiBold(size: 16))
                    .foregroundStyle(Color.black)
                    .padding(.vertical, 3)
                
                TextField("", text: $userName)
                    .font(.pretendardMedium(size: 14))
                    .foregroundStyle(Color.pointOrange)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.pointOrange, lineWidth: 1)
                    )
            }
            .padding(.top, 15)
            
            VStack(alignment: .leading) {
                Text("이메일")
                    .font(.pretendardSemiBold(size: 16))
                    .foregroundStyle(Color.black)
                    .padding(.vertical, 3)
                
                TextField("", text: $email)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray4, lineWidth: 1)
                    )
                    .disabled(true)
                    .foregroundStyle(Color.gray4)
            }
            .padding(.top, 25)
            
            Spacer()
            
            Button(action: {
                // 수정하기 액션
                initialUserName = userName
            }) {
                Text("수정하기")
                    .font(.pretendardSemiBold(size: 18))
                    .foregroundStyle(.white)
                    .frame(width: 353, height: 61)
                    .background(userName != initialUserName && !userName.isEmpty ? Color.pointOrange : Color.gray4)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
            }
            .disabled(userName == initialUserName || userName.isEmpty)
        }
        .padding(.horizontal, 20)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView(initialUserName: .constant("다우니맛"), email: .constant("efiijqoadf@privaterlay.appleid.com"))
    }
}


#Preview {
    ProfileEditView(initialUserName: .constant("다우니맛"), email: .constant("efiijqoadf@privaterlay.appleid.com"))
}

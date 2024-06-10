//
//  CustomTabBar.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 0.8)
                .foregroundColor(Color.gray4)
                .padding(.bottom, 5)
            
            HStack {
                CustomTabBarItem(selectedTab: $selectedTab, tabIndex: 0, activeImage: "tab-home-icon-active", inactiveImage: "tab-home-icon", text: "HOME")
                Spacer()
                CustomTabBarItem(selectedTab: $selectedTab, tabIndex: 1, activeImage: "tab-map-icon-active", inactiveImage: "tab-map-icon", text: "MAP")
                Spacer()
                CustomTabBarItem(selectedTab: $selectedTab, tabIndex: 2, activeImage: "tab-my-icon-active", inactiveImage: "tab-my-icon", text: "MY")
            }
            .frame(height: 60)
            .padding(.horizontal, 55)
        }
        .background(Color.white)
    }
}

struct CustomTabBarItem: View {
    @Binding var selectedTab: Int
    let tabIndex: Int
    let activeImage: String
    let inactiveImage: String
    let text: String
    
    var body: some View {
        Button(action: {
            selectedTab = tabIndex
        }) {
            VStack {
                Image(selectedTab == tabIndex ? activeImage : inactiveImage)
                    .renderingMode(.original)
                Text(text)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(selectedTab == tabIndex ? Color.pointOrange : Color.gray4)
            }
        }
    }
}

//#Preview {
//    CustomTabBar()
//}

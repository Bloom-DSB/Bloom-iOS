//
//  ContentView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated: Bool = true
    @State private var selectedTab = 0
    @State private var hideTabBar = false
    
    var body: some View {
        if isAuthenticated {
            MainTabView(selectedTab: $selectedTab, hideTabBar: $hideTabBar)
        } else {
            LoginView(isAuthenticated: $isAuthenticated)
        }
    }
}

struct MainTabView: View {
    @Binding var selectedTab: Int
    @Binding var hideTabBar: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                if selectedTab == 0 {
                    HomeView(hideTabBar: $hideTabBar)
                } else if selectedTab == 1 {
                    MapView()
                } else if selectedTab == 2 {
                    MyPageView(hideTabBar: $hideTabBar)
                }
                
                VStack {
                    Spacer()
                    if !hideTabBar {
                        CustomTabBar(selectedTab: $selectedTab)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

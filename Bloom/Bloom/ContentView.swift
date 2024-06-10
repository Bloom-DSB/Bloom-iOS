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
    
    var body: some View {
        if isAuthenticated {
            MainTabView(selectedTab: $selectedTab)
        } else {
            LoginView(isAuthenticated: $isAuthenticated)
        }
    }
}

struct MainTabView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            ZStack {
                if selectedTab == 0 {
                    HomeView()
                } else if selectedTab == 1 {
                    MapView()
                } else if selectedTab == 2 {
                    MyPageView()
                }
                
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

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
    @State private var showPicker = false
    @State private var selectedRegion = "서울시 강남구"
    private let regions = ["서울시 강남구", "서울시 서초구", "서울시 송파구", "서울시 강동구"]
    
    var body: some View {
        NavigationView {
            ZStack {
                if selectedTab == 0 {
                    HomeView(hideTabBar: $hideTabBar, showPicker: $showPicker, selectedRegion: $selectedRegion)
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
                
                if showPicker {
                    VStack {
                        Spacer()
                        
                        RegionPickerView(selectedRegion: $selectedRegion, isPresented: $showPicker, regions: regions)
                            .frame(height: 250)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut, value: showPicker)
                            .offset(y: 35)
                    }
                    .background(
                        Color.black.opacity(0.3)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                showPicker = false
                            }
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

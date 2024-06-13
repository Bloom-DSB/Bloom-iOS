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
    @State private var showPicker = false
    @State private var selectedCity = "서울특별시"
    @State private var selectedDistrict = "강남구"
    @ObservedObject private var homeViewModel = HomeViewModel()

    var body: some View {
        if isAuthenticated {
            MainTabView(selectedTab: $selectedTab, hideTabBar: $hideTabBar, showPicker: $showPicker, selectedCity: $selectedCity, selectedDistrict: $selectedDistrict, homeViewModel: homeViewModel)
        } else {
            LoginView(isAuthenticated: $isAuthenticated)
        }
    }
}

struct MainTabView: View {
    @Binding var selectedTab: Int
    @Binding var hideTabBar: Bool
    @Binding var showPicker: Bool
    @Binding var selectedCity: String
    @Binding var selectedDistrict: String
    @ObservedObject var homeViewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case 0:
                    HomeView(homeViewModel: homeViewModel, hideTabBar: $hideTabBar, showPicker: $showPicker, selectedCity: $selectedCity, selectedDistrict: $selectedDistrict)
                case 1:
                    MapView()
                case 2:
                    MyPageView(hideTabBar: $hideTabBar)
                default:
                    HomeView(homeViewModel: homeViewModel, hideTabBar: $hideTabBar, showPicker: $showPicker, selectedCity: $selectedCity, selectedDistrict: $selectedDistrict)
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

                        RegionPickerView(selectedCity: $selectedCity, selectedDistrict: $selectedDistrict, isPresented: $showPicker) {
                            homeViewModel.loadMarkets(location: selectedDistrict)
                        }
                            .frame(height: 265)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut(duration: 0.3))
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

//
//  ContentView.swift
//  Bloom
//
//  Created by 조다은 on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.pretendardBlack(size: 30))
        }
        .padding()
        .background(Colors.pointOrange)
    }
}

#Preview {
    ContentView()
}

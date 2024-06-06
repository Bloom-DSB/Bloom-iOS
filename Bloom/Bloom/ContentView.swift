//
//  ContentView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.pretendardSemiBold(size: 17))
            Text("Hello, world!")

        }
        .padding()
        .background(Colors.baseYellow)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 20.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
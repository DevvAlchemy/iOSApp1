//
//  ContentView.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    @StateObject private var orderStore = OrderStore()

    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab).tag(9)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            OrderPageView()
                .tag(0)
                .tabItem {
                    Image(systemName: "cup.and.saucer.fill")
                    Text("Order")
                }
        }
        .environmentObject(orderStore)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

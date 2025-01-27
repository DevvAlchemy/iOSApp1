//
//  ContentView.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9 //Content starts on Welcometab
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
        .environmentObject(orderStore)//Passed so on every click we have access to updated version
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

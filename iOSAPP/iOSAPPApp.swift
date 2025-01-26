//
//  iOSAPPApp.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//

import SwiftUI

@main
struct iOSAPPAPP: App {
    @StateObject private var orderStore = OrderStore()
    var body: some Scene {
      //  let orderStore = OrderStore
        WindowGroup {
            ContentView()
             //   .onAppear {
            //             print(URL.documentsDirectory)
           //             }
               .environmentObject(orderStore)
        }
    }
}

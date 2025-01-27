//
//  WelcomeView.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.

import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @EnvironmentObject var orderStore: OrderStore
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
            VStack {
                Text("TimCrew")
                    .font(.largeTitle)
                    .padding()
                Spacer()

                Button("Order History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    OrderHistoryView(showOrder: $showHistory)
                        .environmentObject(orderStore)
                }
                .padding(.bottom)
            }

            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Team Coffee")
                            .font(.largeTitle)
                        Text("Ordering made simple")
                            .font(.headline)
                    }
                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.brown)
                }
                .padding()

                Button(action: {
                    selectedTab = 0  // Explicitly set to 0 to navigate to coffee ordering page
                }) {
                    Text("Start Ordering")
                    Image(systemName: "arrow.right.circle")
                }
                .font(.title2)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.brown, lineWidth: 2)
                )
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
            .environmentObject(OrderStore())
    }
}

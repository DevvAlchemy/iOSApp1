//
//  ContentView.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//

import SwiftUI

struct OrderPageView: View {
    @EnvironmentObject var orderStore: OrderStore
    @State private var showOrder = false
    @State private var coffeeType = "Latte" //default selection on order page
    @State private var coffeeSize = "Medium" //default size for orders
    @State private var Quantity = 1
    @State private var coffeeRating = 3

    var body: some View {
        NavigationView {
            VStack {
                // Coffee Type Picker
                Picker("Coffee Type", selection: $coffeeType) {
                    Text("Latte").tag("Latte")
                    Text("Cappuccino").tag("Cappuccino")
                    Text("Americano").tag("Americano")
                    Text("Espresso").tag("Espresso")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Coffee Size Picker
                Picker("Coffee Size", selection: $coffeeSize) {
                    Text("Small").tag("Small")
                    Text("Medium").tag("Medium")
                    Text("Large").tag("Large")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                //Quantity
                QuantityView (quantity:$Quantity)
                    .padding()

                // Coffee Rating
                CoffeeRatingView(rating: $coffeeRating)
                    .padding()

                // Save Order Button
                Button(action: {
                    let newOrder = "\(coffeeType) - \(coffeeSize)(Quantity: \(Quantity) (Rating: \(coffeeRating))"
                    orderStore.addOrder(newOrder)
                }) {
                    Text("Save Order")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(55)
                }
                .padding()

                Spacer()

                // Order History Button
                Button(action: { showOrder.toggle() }) {
                    Text("View Order History")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                }
                .padding()
            }
            .navigationTitle("Tim Hortons Orders")
            .sheet(isPresented: $showOrder) {
                OrderHistoryView(showOrder: $showOrder)
                    .environmentObject(orderStore)
            }
        }
    }
}

struct OrderPageView_Previews: PreviewProvider {
    static var previews: some View {
        OrderPageView()
            .environmentObject(OrderStore())
    }
}

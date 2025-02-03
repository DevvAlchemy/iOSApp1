import SwiftUI

struct OrderPageView: View {
    @EnvironmentObject var orderStore: OrderStore
    @State private var showOrder = false
    @State private var coffeeType = "Latte" //default selection on order page
    @State private var coffeeSize = "Medium" //default size for orders
    @State private var quantity = 1
    @State private var coffeeRating = 3
    @State private var showError = false
    @State private var errorMessage = ""

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
                QuantityView(quantity: $quantity)
                    .padding()

                // Coffee Rating
                CoffeeRatingView(rating: $coffeeRating)
                    .padding()

                // Save Order Button
                Button(action: {
                    do {
                        let newOrder = "\(coffeeType) - \(coffeeSize) (Quantity: \(quantity)) (Rating: \(coffeeRating))"
                        try orderStore.addOrder(newOrder)
                    } catch OrderStore.OrderError.dataNotFound {
                        showError = true
                        errorMessage = "Unable to save order. Data not found."
                    } catch {
                        showError = true
                        errorMessage = "Failed to save order. Please try again."
                    }
                }) {
                    Text("Save Order")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 55)
                                .fill(Color.orange.opacity(0.7))
                                .shadow(color: .black.opacity(0.2), radius: 3, x: 2, y: 2)
                        }
                        .foregroundColor(.white)
                }
                .padding()
                .disabled(orderStore.isLoading)

                Spacer()

                // Order History Button
                Button(action: { showOrder.toggle() }) {
                    Text("View Order History")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray.opacity(0.2))
                                .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
                        }
                }
                .padding()
            }
            .navigationTitle("Tim Hortons Orders")
            .sheet(isPresented: $showOrder) {
                OrderHistoryView(showOrder: $showOrder)
                    .environmentObject(orderStore)
            }
            .alert("Error", isPresented: $showError) {
                Button("OK", role: .cancel) {
                    showError = false
                }
            } message: {
                Text(errorMessage)
            }
            .overlay {
                if orderStore.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }
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

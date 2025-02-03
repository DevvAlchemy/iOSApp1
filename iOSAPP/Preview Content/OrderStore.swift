import Foundation

struct OrderDay: Identifiable {
    let id = UUID()
    let date: Date
    var orders: [String] = []
}

class OrderStore: ObservableObject {
    @Published var orderDays: [OrderDay]?
    @Published var loadingError = false
    @Published var isLoading = false

    enum OrderError: Error {
        case dataNotFound
        case invalidData
        case saveError
    }

    init() {
        self.orderDays = []
        #if DEBUG
        try? createDevData()
        #endif
    }

    func addOrder(_ orderName: String) throws {
        isLoading = true
        defer { isLoading = false }

        guard var orders = orderDays else {
            loadingError = true
            throw OrderError.dataNotFound
        }

        let today = Date()

        if !orders.isEmpty, today.isSameDay(as: orders[0].date) {
            orders[0].orders.append(orderName)
        } else {
            orders.insert(
                OrderDay(date: today, orders: [orderName]),
                at: 0
            )
        }

        self.orderDays = orders
    }

    private func createDevData() throws {
        let sampleOrders = ["Latte - Medium", "Americano - Large"]
            .map { "Sample: \($0)" }

        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!

        orderDays = [
            OrderDay(date: Date(), orders: sampleOrders),
            OrderDay(date: yesterday, orders: ["Espresso - Small"])
        ]
    }
}

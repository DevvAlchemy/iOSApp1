//
//  OrderTimerview.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//

import SwiftUI

struct OrderCountdownView: View {
    let date: Date
    @Binding var timeRemaining: Int
    let size: Double

    var body: some View {
        Text("\(timeRemaining) mins")
            .font(.system(size: size, design: .rounded))
            .padding()
            .onChange(of: date) { _ in
                timeRemaining -= 1
            }
    }
}

struct OrderTimerView: View {
    @State private var timeRemaining: Int = 15
    @Binding var timerDone: Bool
    let size: Double

    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: timeRemaining <= 0)) { context in
                    OrderCountdownView(
                        date: context.date,
                        timeRemaining: $timeRemaining,
                        size: size)
                }
                .onChange(of: timeRemaining) { _ in
                    if timeRemaining < 1 {
                        timerDone = true
                    }
                }
    }
}

struct OrderTimerView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTimerView(timerDone: .constant(false), size: 90)
    }
}

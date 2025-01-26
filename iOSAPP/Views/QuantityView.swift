//
//  QuantityView.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//

import SwiftUI

struct QuantityView: View {
    @Binding var quantity: Int
    let maximumQuantity = 10

    let onColor = Color.brown //when clicked
    let offColor = Color.gray.opacity(0.5) //ones not clicked

    var body: some View {
     //   Text("Quantity")
        HStack {
            ForEach(1 ..< maximumQuantity + 1, id: \.self) { index in
                Image(systemName: "cup.and.saucer.fill") //cups style to match the product being sold
                    .foregroundColor(
                        index > quantity ? offColor : onColor)
                    .onTapGesture {
                        quantity = index
                    }
            }
        }
        .font(.title3)
    }
}

struct QuantityView_Previews: PreviewProvider {
    static var previews: some View {
      QuantityView(quantity: .constant(1))
            .previewLayout(.sizeThatFits)
    }
}

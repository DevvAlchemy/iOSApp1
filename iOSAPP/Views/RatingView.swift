//
//  RatingView.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//

import SwiftUI

struct CoffeeRatingView: View {
    @Binding var rating: Int
    let maximumRating = 5

    let onColor = Color.orange //when clicked
    let offColor = Color.gray //ones not clicked

    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Image(systemName: "star.fill") //cups style to match the product being sold
                    .foregroundColor(
                        index > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
        .font(.largeTitle)
    }
}

struct CoffeeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeRatingView(rating: .constant(3)) 
            .previewLayout(.sizeThatFits)
    }
}

//
//  ItemView.swift
//  Fruti
//
//  Created by saket bhushan on 17/01/25.
//

import SwiftUI

struct SmoothieRow: View {
    
    var smoothie: Smoothie
    
    var body: some View {
        HStack(alignment: .top) {
            smoothie.image
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(smoothie.title)
                    .font(.headline)

                Text(smoothie.getIngredients())
                    .lineLimit(2)
            }
            
        }
    }
}
//
//#Preview {
//    SmoothieRow(item: .init(name: "Berry Blue",
//                         ingredients: "Orange, Blue Berry and Avocado",
//                         calories: "520 Calories"))
//}

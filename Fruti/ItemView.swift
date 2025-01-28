//
//  ItemView.swift
//  Fruti
//
//  Created by saket bhushan on 17/01/25.
//

import SwiftUI

struct ItemView: View {
    
    @State var item: Model
    
    var body: some View {
        HStack(alignment: .top) {
            Image("smoothie/berry-blue")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)

                Text(item.ingredients)
                    .lineLimit(2)
                
                Text(item.calories)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            
        }
    }
}

#Preview {
    ItemView(item: .init(name: "Berry Blue",
                         ingredients: "Orange, Blue Berry and Avocado",
                         calories: "520 Calories"))
}

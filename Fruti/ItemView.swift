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
        HStack {
            Image("blueberry")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
            VStack(alignment: .leading) {
                Text(item.name)
                    .bold()
                Text(item.ingredients)
                Text(item.calories)
                    .foregroundStyle(.gray)
            }
            
        }
    }
}

#Preview {
    ItemView(item: .init(name: "Berry Blue",
                         ingredients: "Orange, Blue Berry and Avocado",
                         calories: "520 Calories"))
}

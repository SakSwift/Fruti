//
//  MenuListView.swift
//  Fruti
//
//  Created by saket bhushan on 17/01/25.
//

import SwiftUI

struct Model: Identifiable {
    var id = UUID()
    let name: String
    let ingredients: String
    let calories: String
}

struct MenuListView: View {
    
    @State var items: [Model] =
    [
        .init(name: "Berry Blue",
              ingredients: "Orange, Blue Berry and Avocado",
              calories: "520 Calories"),
        .init(name: "Carrot Chops",
              ingredients: "Orange, Carrot and Mango",
              calories: "230 Calories"),
        .init(name: "Berry Blue",
              ingredients: "Orange, Blue Berry and Avocado",
              calories: "520 Calories"),
        .init(name: "Carrot Chops",
              ingredients: "Orange, Carrot and Mango",
              calories: "230 Calories"),
        .init(name: "Berry Blue",
              ingredients: "Orange, Blue Berry and Avocado",
              calories: "520 Calories"),
        .init(name: "Carrot Chops",
              ingredients: "Orange, Carrot and Mango",
              calories: "230 Calories"),
        .init(name: "Berry Blue",
              ingredients: "Orange, Blue Berry and Avocado",
              calories: "520 Calories"),
        .init(name: "Carrot Chops",
              ingredients: "Orange, Carrot and Mango",
              calories: "230 Calories")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    ItemView(item: item)
                }
            }
            .navigationTitle(Text("Menu"))
        }
    }
}

#Preview {
    MenuListView()
}

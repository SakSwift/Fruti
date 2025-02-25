//
//  FavouritesListView.swift
//  Fruti
//
//  Created by saket bhushan on 30/01/25.
//

import SwiftUI

struct FavouritesListView: View {
    
    @State var items: [Model] =
    [
        .init(name: "MangoShake", ingredients: "Milk and Mango", calories: "600")
    ]
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    ItemView(item: item)
                }
            }.overlay {
                if items.isEmpty {
                    Text("Add some smoothies to your favourites!")
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background()
                        .ignoresSafeArea()
                }
            }
            .searchable(text: $searchText)
            .navigationTitle(Text("Favourites"))
        }
    }
}

#Preview {
    FavouritesListView()
}

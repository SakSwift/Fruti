//
//  FavouritesListView.swift
//  Fruti
//
//  Created by saket bhushan on 30/01/25.
//

import SwiftUI

struct FavouritesListView: View {
    
    var smoothies: [Smoothie]
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(smoothies) { inSmoothie in
                    SmoothieRow(smoothie: inSmoothie)
                }
            }.overlay {
                if smoothies.isEmpty {
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

//#Preview {
//    FavouritesListView()
//}

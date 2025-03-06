//
//  TabNavigation.swift
//  Fruti
//
//  Created by saket bhushan on 30/01/25.
//

import SwiftUI

struct TabNavigation: View {
    
    enum Tabs {
        case menu
        case favourites
    }
    
    @State var selection: Tabs = .menu
    
    var body: some View {
        TabView(selection: $selection) {
            
            Tab("Menu", systemImage: "list.bullet", value: .menu) {
                MenuListView(smoothies: Smoothie.all())// TODO: replace empty with 'Smoothie.all'
            }
            
            Tab("Favourites", systemImage: "heart.fill", value: .favourites) {
                FavouritesListView(smoothies: [])// TODO: replace empty with 'Smoothie.all'
            }
            
        }
    }
}

#Preview {
    TabNavigation()
}

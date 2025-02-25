//
//  SideBarNavigation.swift
//  Fruti
//
//  Created by saket bhushan on 30/01/25.
//

import SwiftUI

struct SideBarNavigation: View {
    var body: some View {
        
        NavigationSplitView {
            List {
                NavigationLink {
                    MenuListView(smoothies: []) // TODO: replace empty with 'Smoothie.all'
                } label: {
                    Label("Menu", systemImage: "list.bullet")
                }
                
                NavigationLink {
                    FavouritesListView(smoothies: []) // TODO: replace empty with 'Smoothie.all'
                } label: {
                    Label("Favourites", systemImage: "heart")
                }
            }
        } content: {
            Text("Select a category")
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .ignoresSafeArea()
            
        } detail: {
            Text("Select a smoothie")
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    SideBarNavigation()
}

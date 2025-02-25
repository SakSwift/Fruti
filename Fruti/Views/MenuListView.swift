//
//  MenuListView.swift
//  Fruti
//
//  Created by saket bhushan on 17/01/25.
//

import SwiftUI

struct MenuListView: View {
    
    @State var searchText: String = ""
    
    var smoothies: [Smoothie]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(smoothies) { smoothie in
                    NavigationLink {
                        // TODO: Add details view here..
                    } label: {
                        SmoothieRow(smoothie: smoothie)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle(Text("Menu"))
            .onAppear {
                let value = getNutrition
                print("val: \(value)")
            }
        }
    }
}

//#Preview {
//    MenuListView(smoothies: <#[Smoothie]#>)
//}

//
//  ContentView.swift
//  Fruti
//
//  Created by saket bhushan on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            TabNavigation()
        } else {
            SideBarNavigation()
        }
    }
}

#Preview {
    ContentView()
}

//
//  Smoothie+SwiftUI.swift
//  Fruti
//
//  Created by saket bhushan on 25/02/25.
//

import SwiftUI

extension Smoothie {
    var image: Image {
        Image("smoothie/\(id)")
            .renderingMode(.original)
    }
}

//
//  Ingredient+Nutrition.swift
//  Fruti
//
//  Created by saket bhushan on 15/03/25.
//

import Foundation

extension Ingredient {
    var nutrition: Nutrition? {
        Nutrition.lookupFoodItem(id, forVolume: .cups(1))
    }
}

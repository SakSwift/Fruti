//
//  MeasuredIngredient.swift
//  Fruti
//
//  Created by saket bhushan on 25/02/25.
//

import Foundation

struct MeasuredIngredient {
    var ingredient: Ingredient
    var measurement: Measurement<UnitVolume>
    
    init(ingredient: Ingredient, measurement: Measurement<UnitVolume>) {
        self.ingredient = ingredient
        self.measurement = measurement
    }
}

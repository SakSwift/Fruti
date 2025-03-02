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


extension Ingredient {
    func measured(with unit: UnitVolume) -> MeasuredIngredient {
        return .init(ingredient: self, measurement: .init(value: 1, unit: unit))
    }
}

extension MeasuredIngredient {
    
    func scaled(by scale: Double) -> MeasuredIngredient {
        return .init(ingredient: ingredient, measurement: measurement * scale)
    }
}

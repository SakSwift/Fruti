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
    
    var kiloCalories: Int {
        guard let nutrition = nutrition else {
            return 0
        }
        return Int(nutrition.kilocalories)
    }
    
    // Nutritional information according to the quantity of this measurement.
    var nutrition: Nutrition? {
        guard let nutritionFact = ingredient.nutrition else {
            return nil
        }
        let mass = measurement.convertedToMass(usingDensity: nutritionFact.density)
        return nutritionFact.converted(toMass: mass)
    }
    
    func scaled(by scale: Double) -> MeasuredIngredient {
        return .init(ingredient: ingredient, measurement: measurement * scale)
    }
}

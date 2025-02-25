//
//  Nutrition.swift
//  Fruti
//
//  Created by saket bhushan on 15/02/25.
//

import Foundation

struct Nutrition {
    let identifier: String
    let localizedFoodItemName: String
    let referenceMass: Measurement<UnitMass>
    let density: Density
    let totalSaturatedFat: Measurement<UnitMass>
    let totalMonounsaturatedFat: Measurement<UnitMass>
    let totalPolyunsaturatedFat: Measurement<UnitMass>
    let cholesterol: Measurement<UnitMass>
    let sodium: Measurement<UnitMass>
    let totalCarbohydrates: Measurement<UnitMass>
    let dietaryFiber: Measurement<UnitMass>
    let sugar: Measurement<UnitMass>
    let protein: Measurement<UnitMass>
    let calcium: Measurement<UnitMass>
    let potassium: Measurement<UnitMass>
    let vitaminA: Measurement<UnitMass>
    let vitaminC: Measurement<UnitMass>
    let iron: Measurement<UnitMass>
}

struct Density {
    let mass: Measurement<UnitMass>
    let volume: Measurement<UnitVolume>

    init(mass: Measurement<UnitMass>, volume: Measurement<UnitVolume>) {
        self.mass = mass
        self.volume = volume
    }
    
    init(_ massAmount: Double, _ massUnit: UnitMass, per volumeAmount: Double, _ volumeUnit: UnitVolume) {
        self.mass = Measurement(value: massAmount, unit: massUnit)
        self.volume = Measurement(value: volumeAmount, unit: volumeUnit)
    }
}

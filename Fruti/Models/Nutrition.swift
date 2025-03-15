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
    public var totalFat: Measurement<UnitMass> {
        return totalSaturatedFat + totalMonounsaturatedFat + totalPolyunsaturatedFat
    }
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

// MARK: - Volume <-> Mass Conversion

extension Measurement where UnitType == UnitVolume {
    func convertedToMass(usingDensity density: Density) -> Measurement<UnitMass> {
        let densityLiters = density.volume.converted(to: .liters).value
        let liters = converted(to: .liters).value
        let scale = liters / densityLiters
        return density.mass * scale
    }
}

extension Measurement where UnitType == UnitMass {
    func convertedToVolume(usingDensity density: Density) -> Measurement<UnitVolume> {
        let densityKilograms = density.mass.converted(to: .kilograms).value
        let kilograms = converted(to: .kilograms).value
        let scale = kilograms / densityKilograms
        return density.volume * scale
    }
}

extension Nutrition {
    /// Nutritional information is for 100 grams, unless a `mass` is specified.
    public static func lookupFoodItem(_ foodItemIdentifier: String,
                                      forMass mass: Measurement<UnitMass> = Measurement(value: 100, unit: .grams)) -> Nutrition? {
        return getNutrition[foodItemIdentifier]?.converted(toMass: mass)
    }

    /// Nutritional information is for 1 cup, unless a `volume` is specified.
    public static func lookupFoodItem(_ foodItemIdentifier: String,
                                      forVolume volume: Measurement<UnitVolume> = Measurement(value: 1, unit: .cups)) -> Nutrition? {
        guard let nutritionFact = getNutrition[foodItemIdentifier] else {
            return nil
        }

        // Convert volume to mass via density
        let mass = volume.convertedToMass(usingDensity: nutritionFact.density)
        return nutritionFact.converted(toMass: mass)
    }

    // MARK: - Examples

    public static var banana: Nutrition {
        getNutrition["banana"]!
    }

    public static var blueberry: Nutrition {
        getNutrition["blueberry"]!
    }

    public static var peanutButter: Nutrition {
        getNutrition["peanut-butter"]!
    }

    public static var almondMilk: Nutrition {
        getNutrition["almond-milk"]!
    }

    public static var zero: Nutrition {
        Nutrition(
            identifier: "",
            localizedFoodItemName: "",
            referenceMass: .grams(0),
            density: Density(mass: .grams(1), volume: .cups(1)),
            totalSaturatedFat: .grams(0),
            totalMonounsaturatedFat: .grams(0),
            totalPolyunsaturatedFat: .grams(0),
            cholesterol: .grams(0),
            sodium: .grams(0),
            totalCarbohydrates: .grams(0),
            dietaryFiber: .grams(0),
            sugar: .grams(0),
            protein: .grams(0),
            calcium: .grams(0),
            potassium: .grams(0),
            vitaminA: .grams(0),
            vitaminC: .grams(0),
            iron: .grams(0)
        )
    }
}

extension Nutrition {
    func converted(toVolume newReferenceVolume: Measurement<UnitVolume>) -> Nutrition {
        let newRefMassInCups = newReferenceVolume.converted(to: .cups).value
        let oldRefMassInCups = referenceMass.convertedToVolume(usingDensity: self.density).value
        
        let scaleFactor = newRefMassInCups / oldRefMassInCups
        
        return Nutrition(
            identifier: identifier,
            localizedFoodItemName: localizedFoodItemName,
            referenceMass: referenceMass * scaleFactor,
            density: density,
            totalSaturatedFat: totalSaturatedFat * scaleFactor,
            totalMonounsaturatedFat: totalMonounsaturatedFat * scaleFactor,
            totalPolyunsaturatedFat: totalPolyunsaturatedFat * scaleFactor,
            cholesterol: cholesterol * scaleFactor,
            sodium: sodium * scaleFactor,
            totalCarbohydrates: totalCarbohydrates * scaleFactor,
            dietaryFiber: dietaryFiber * scaleFactor,
            sugar: sugar * scaleFactor,
            protein: protein * scaleFactor,
            calcium: calcium * scaleFactor,
            potassium: potassium * scaleFactor,
            vitaminA: vitaminA * scaleFactor,
            vitaminC: vitaminC * scaleFactor,
            iron: iron * scaleFactor
        )
    }
    
    public func converted(toMass newReferenceMass: Measurement<UnitMass>) -> Nutrition {
        let newRefMassInGrams = newReferenceMass.converted(to: .grams).value
        let oldRefMassInGrams = referenceMass.converted(to: .grams).value
        let scaleFactor = newRefMassInGrams / oldRefMassInGrams
        return Nutrition(
            identifier: identifier,
            localizedFoodItemName: localizedFoodItemName,
            referenceMass: newReferenceMass,
            density: density,
            totalSaturatedFat: totalSaturatedFat * scaleFactor,
            totalMonounsaturatedFat: totalMonounsaturatedFat * scaleFactor,
            totalPolyunsaturatedFat: totalPolyunsaturatedFat * scaleFactor,
            cholesterol: cholesterol * scaleFactor,
            sodium: sodium * scaleFactor,
            totalCarbohydrates: totalCarbohydrates * scaleFactor,
            dietaryFiber: dietaryFiber * scaleFactor,
            sugar: sugar * scaleFactor,
            protein: protein * scaleFactor,
            calcium: calcium * scaleFactor,
            potassium: potassium * scaleFactor,
            vitaminA: vitaminA * scaleFactor,
            vitaminC: vitaminC * scaleFactor,
            iron: iron * scaleFactor
        )
    }
    
    public func amount(_ mass: Measurement<UnitMass>) -> Nutrition {
        return converted(toMass: mass)
    }
    
    public func amount(_ volume: Measurement<UnitVolume>) -> Nutrition {
        let mass = volume.convertedToMass(usingDensity: density)
        return converted(toMass: mass)
    }
}

// MARK: - Convenience Accessors

extension Measurement where UnitType == UnitVolume {
    public static func cups(_ cups: Double) -> Measurement<UnitVolume> {
        return Measurement(value: cups, unit: .cups)
    }

    public static func tablespoons(_ tablespoons: Double) -> Measurement<UnitVolume> {
        return Measurement(value: tablespoons, unit: .tablespoons)
    }
}

extension Measurement where UnitType == UnitMass {
    public static func grams(_ grams: Double) -> Measurement<UnitMass> {
        return Measurement(value: grams, unit: .grams)
    }
}

//
//  Nutrition+Decodable.swift
//  Fruti
//
//  Created by saket bhushan on 21/02/25.
//

import Foundation

var getNutrition: [String: Nutrition] = {
    guard let url = Bundle.main.url(forResource: "NutritionalItems", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let nutrition = try? JSONDecoder().decode([String: Nutrition].self, from: data) else {
        return [:]
    }
    return nutrition
}()

extension Nutrition: Decodable {
    
    enum CodingKeys: CodingKey {
        case identifier
        case localizedFoodItemName
        case referenceMass
        case density
        case totalSaturatedFat
        case totalMonounsaturatedFat
        case totalPolyunsaturatedFat
        case cholesterol
        case sodium
        case totalCarbohydrates
        case dietaryFiber
        case sugar
        case protein
        case calcium
        case potassium
        case vitaminA
        case vitaminC
        case iron
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try container.decode(String.self, forKey: .identifier)
        localizedFoodItemName = try container.decode(String.self, forKey: .localizedFoodItemName)
        referenceMass = try container.decode(Measurement<UnitMass>.self, forKey: .referenceMass)
        
        let densityString = try container.decode(String.self, forKey: .density)
        density = Density.fromString(densityString)
        
        totalSaturatedFat = try container.decode(Measurement<UnitMass>.self, forKey: .totalSaturatedFat)
        totalMonounsaturatedFat = try container.decode(Measurement<UnitMass>.self, forKey: .totalMonounsaturatedFat)
        totalPolyunsaturatedFat = try container.decode(Measurement<UnitMass>.self, forKey: .totalMonounsaturatedFat)
        cholesterol = try container.decode(Measurement<UnitMass>.self, forKey: .cholesterol)
        sodium = try container.decode(Measurement<UnitMass>.self, forKey: .sodium)
        totalCarbohydrates = try container.decode(Measurement<UnitMass>.self, forKey: .totalCarbohydrates)
        dietaryFiber = try container.decode(Measurement<UnitMass>.self, forKey: .dietaryFiber)
        sugar = try container.decode(Measurement<UnitMass>.self, forKey: .sugar)
        protein = try container.decode(Measurement<UnitMass>.self, forKey: .protein)
        calcium = try container.decode(Measurement<UnitMass>.self, forKey: .calcium)
        potassium = try container.decode(Measurement<UnitMass>.self, forKey: .potassium)
        vitaminA = try container.decode(Measurement<UnitMass>.self, forKey: .vitaminA)
        vitaminC = try container.decode(Measurement<UnitMass>.self, forKey: .vitaminC)
        iron = try container.decode(Measurement<UnitMass>.self, forKey: .iron)
    }
}

extension KeyedDecodingContainer {
    public func decode(_ type: Measurement<UnitMass>.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Measurement<UnitMass> {
        let value = try decode(String.self, forKey: key)
        return Measurement(string: value)
    }
}

extension Measurement where UnitType == UnitMass {
    init(string: String) {
        let components = string.split(separator: " ")
        let val = String(components[0])
        let unit = UnitMass.fromSymbol(String(components[1]))
        self.init(value: Double(val)!, unit: unit)
    }
}

extension UnitVolume {
    static func fromSymbol(_ symbol: String) -> UnitVolume {
        switch symbol {
        case "gal":
            return .gallons
        case "cup":
            return .cups
        default:
            return UnitVolume(symbol: symbol)
        }
    }
}

extension UnitMass {
    static func fromSymbol(_ symbol: String) -> UnitMass {
        switch symbol {
        case "kg":
            return .kilograms
        case "g":
            return .grams
        case "mg":
            return .milligrams
        default:
            return UnitMass(symbol: symbol)
        }
    }
}

extension UnitEnergy {
    static func fromSymbol(_ symbol: String) -> UnitEnergy {
        switch symbol {
        case "kCal":
            return .kilocalories
        default:
            return UnitEnergy(symbol: symbol)
        }
    }
}

extension Density {
    
    // Example: "225 g per 1 cup"
    static func fromString(_ arg: String) -> Density {
        
        let components = arg.split(separator: " ")
        
        let massValue = Double(components[0])!
        let massUnit = UnitMass.fromSymbol(String(components[1]))
        
        let volumeValue = Double(components[3])!
        let volumeUnit = UnitVolume.fromSymbol(String(components[4]))
        
        return Density(massValue, massUnit, per: volumeValue, volumeUnit)
    }
}

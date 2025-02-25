//
//  File.swift
//  Fruti
//
//  Created by saket bhushan on 25/02/25.
//
/*
Abstract:
A model that represents a smoothie ingredient and its appearance as a thumbnail and card.
*/

struct Ingredient: Identifiable {
    var id: String
    var name: String
    var title = CardTitle()
    var thumbnailCrop = Crop()
    var cardCrop = Crop()
}

extension Ingredient {
    static let all: [Ingredient] = [
        .avocado,
        .almondMilk,
        .banana,
        .blueberry,
        .carrot,
        .chocolate,
        .coconut,
        .kiwi,
        .lemon,
        .mango,
        .orange,
        .papaya,
        .peanutButter,
        .pineapple,
        .raspberry,
        .spinach,
        .strawberry,
        .watermelon
    ]
    
    init?(id: Ingredient.ID) {
        guard let value = Ingredient.all.first(where: { $0.id == id }) else {
            return nil
        }
        self = value
    }
}

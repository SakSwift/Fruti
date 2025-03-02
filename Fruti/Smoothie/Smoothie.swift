//
//  Smoothie.swift
//  Fruti
//
//  Created by saket bhushan on 25/02/25.
//

import SwiftUI

struct Smoothie: Identifiable {
    var id: String
    var title: String
    var description: AttributedString
    var measuredIngredients: [MeasuredIngredient]
}

// MARK: - Smoothie List
extension Smoothie {
    @SmoothieArrayBuilder
    static func all(includingPaid: Bool = true) -> [Smoothie] {
        Smoothie(id: "berry-blue", title: String(localized: "Berry Blue", comment: "Smoothie name")) {
            AttributedString(localized: "*Filling* and *refreshing*, this smoothie will fill you with joy!",
                             comment: "Berry Blue smoothie description")

            Ingredient.orange.measured(with: .cups).scaled(by: 1.5)
            Ingredient.blueberry.measured(with: .cups)
            Ingredient.avocado.measured(with: .cups).scaled(by: 0.2)
        }

        Smoothie(id: "carrot-chops", title: String(localized: "Carrot Chops", comment: "Smoothie name")) {
            AttributedString(localized: "*Packed* with vitamin A and C, Carrot Chops is a great way to start your day!",
                             comment: "Carrot Chops smoothie description")

            Ingredient.orange.measured(with: .cups).scaled(by: 1.5)
            Ingredient.carrot.measured(with: .cups).scaled(by: 0.5)
            Ingredient.mango.measured(with: .cups).scaled(by: 0.5)
        }

        if includingPaid {
            Smoothie(id: "pina-y-coco", title: String(localized: "Piña y Coco", comment: "Smoothie name")) {
                AttributedString(localized: "Enjoy the *tropical* flavors of coconut and pineapple!", comment: "Piña y Coco smoothie description")
                Ingredient.pineapple.measured(with: .cups).scaled(by: 1.5)
                Ingredient.almondMilk.measured(with: .cups)
                Ingredient.coconut.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "hulking-lemonade", title: String(localized: "Hulking Lemonade", comment: "Smoothie name")) {
                AttributedString(localized: "This is not just *any* lemonade. It will give you *powers* you'll struggle to control!",
                                  comment: "Hulking Lemonade smoothie description")
                Ingredient.lemon.measured(with: .cups).scaled(by: 1.5)
                Ingredient.spinach.measured(with: .cups)
                Ingredient.avocado.measured(with: .cups).scaled(by: 0.2)
                Ingredient.water.measured(with: .cups).scaled(by: 0.2)
            }

            Smoothie(id: "kiwi-cutie", title: String(localized: "Kiwi Cutie", comment: "Smoothie name")) {
                AttributedString(localized: "Kiwi Cutie is beautiful *inside* ***and*** *out*! Packed with nutrients to start your day!",
                                  comment: "Kiwi Cutie smoothie description")
                Ingredient.kiwi.measured(with: .cups)
                Ingredient.orange.measured(with: .cups)
                Ingredient.spinach.measured(with: .cups)
            }

            Smoothie( id: "lemonberry", title: String(localized: "Lemonberry", comment: "Smoothie name")) {
                AttributedString(localized: "A refreshing blend that's a *real kick*!", comment: "Lemonberry smoothie description")

                Ingredient.raspberry.measured(with: .cups)
                Ingredient.strawberry.measured(with: .cups)
                Ingredient.lemon.measured(with: .cups).scaled(by: 0.5)
                Ingredient.water.measured(with: .cups).scaled(by: 0.5)

            }

            Smoothie(id: "love-you-berry-much", title: String(localized: "Love You Berry Much", comment: "Smoothie name")) {
                AttributedString(localized: "If you *love* berries berry berry much, you will love this one!",
                                 comment: "Love You Berry Much smoothie description")

                Ingredient.strawberry.measured(with: .cups).scaled(by: 0.75)
                Ingredient.blueberry.measured(with: .cups).scaled(by: 0.5)
                Ingredient.raspberry.measured(with: .cups).scaled(by: 0.5)
                Ingredient.water.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "mango-jambo", title: String(localized: "Mango Jambo", comment: "Smoothie name")) {
                AttributedString(localized: "Dance around with this *delicious* tropical blend!", comment: "Mango Jambo smoothie description")

                Ingredient.mango.measured(with: .cups)
                Ingredient.pineapple.measured(with: .cups).scaled(by: 0.5)
                Ingredient.water.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "one-in-a-melon", title: String(localized: "One in a Melon", comment: "Smoothie name")) {
                AttributedString(localized: "Feel special this summer with the *coolest* drink in our menu!",
                                 comment: "One in a Melon smoothie description")

                Ingredient.watermelon.measured(with: .cups).scaled(by: 2)
                Ingredient.raspberry.measured(with: .cups)
                Ingredient.water.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "papas-papaya", title: String(localized: "Papa's Papaya", comment: "Smoothie name")) {
                AttributedString(localized: "Papa would be proud of you if he saw you drinking this!", comment: "Papa's Papaya smoothie description")

                Ingredient.orange.measured(with: .cups)
                Ingredient.mango.measured(with: .cups).scaled(by: 0.5)
                Ingredient.papaya.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "peanut-butter-cup", title: String(localized: "Peanut Butter Cup", comment: "Smoothie name")) {
                AttributedString(localized: "Ever wondered what it was like to *drink a peanut butter cup*? Wonder no more!",
                                 comment: "Peanut Butter Cup smoothie description")

                Ingredient.almondMilk.measured(with: .cups)
                Ingredient.banana.measured(with: .cups).scaled(by: 0.5)
                Ingredient.chocolate.measured(with: .tablespoons).scaled(by: 2)
                Ingredient.peanutButter.measured(with: .tablespoons)
            }

            Smoothie(id: "sailor-man", title: String(localized: "Sailor Man", comment: "Smoothie name")) {
                AttributedString(localized: "*Get strong* with this delicious spinach smoothie!", comment: "Sailor Man smoothie description")

                Ingredient.orange.measured(with: .cups).scaled(by: 1.5)
                Ingredient.spinach.measured(with: .cups)
            }

            Smoothie(id: "thats-a-smore", title: String(localized: "That's a Smore!", comment: "Smoothie name")) {
                AttributedString(localized: "When the world seems to rock like you've had too much choc, that's *a smore*!",
                                 comment: "That's a Smore! smoothie description")

                Ingredient.almondMilk.measured(with: .cups)
                Ingredient.coconut.measured(with: .cups).scaled(by: 0.5)
                Ingredient.chocolate.measured(with: .tablespoons)
            }
        }

        Smoothie(id: "thats-berry-bananas", title: String(localized: "That's Berry Bananas!", comment: "Smoothie name")) {
            AttributedString(localized: "You'll go *crazy* with this classic!", comment: "That's Berry Bananas! smoothie description")

            Ingredient.almondMilk.measured(with: .cups)
            Ingredient.banana.measured(with: .cups)
            Ingredient.strawberry.measured(with: .cups)
        }

        if includingPaid {
            Smoothie(id: "tropical-blue", title: String(localized: "Tropical Blue", comment: "Smoothie name")) {
                AttributedString(
                    localized: "A delicious blend of *tropical fruits and blueberries* will have you sambaing around like you never knew you could!",
                                  comment: "Tropical Blue smoothie description")
                Ingredient.almondMilk.measured(with: .cups)
                Ingredient.banana.measured(with: .cups).scaled(by: 0.5)
                Ingredient.blueberry.measured(with: .cups).scaled(by: 0.5)
                Ingredient.mango.measured(with: .cups).scaled(by: 0.5)
            }
        }
    }

    // Used in previews.
    // TODO: Fix me!!
//    static var berryBlue: Smoothie { Smoothie(for: "berry-blue")! }
//    static var kiwiCutie: Smoothie { Smoothie(for: "kiwi-cutie")! }
//    static var hulkingLemonade: Smoothie { Smoothie(for: "hulking-lemonade")! }
//    static var mangoJambo: Smoothie { Smoothie(for: "mango-jambo")! }
//    static var tropicalBlue: Smoothie { Smoothie(for: "tropical-blue")! }
//    static var lemonberry: Smoothie { Smoothie(for: "lemonberry")! }
//    static var oneInAMelon: Smoothie { Smoothie(for: "one-in-a-melon")! }
//    static var thatsASmore: Smoothie { Smoothie(for: "thats-a-smore")! }
//    static var thatsBerryBananas: Smoothie { Smoothie(for: "thats-berry-bananas")! }
}

@resultBuilder
enum SmoothieArrayBuilder {
    
    static func buildEither(first component: [Smoothie]) -> [Smoothie] {
        return component
    }
    
    static func buildEither(second component: [Smoothie]) -> [Smoothie] {
        return component
    }
    
    static func buildOptional(_ component: [Smoothie]?) -> [Smoothie] {
        return component ?? []
    }
    static func buildBlock(_ components: [Smoothie]...) -> [Smoothie] {
        return components.flatMap { $0 }
    }
    
    static func buildExpression(_ expression: Smoothie) -> [Smoothie] {
        return [expression]
    }
    
    static func buildExpression(_ expression: Void) -> [Smoothie] {
        return []
    }
}

extension Smoothie {
    
    init(id: String, title: String, @SmoothieBuilder _ makeIngredient: () -> (AttributedString, [MeasuredIngredient])) {
        let (description, measuredIngredient) = makeIngredient()
        self.init(id: id, title: title, description: description, measuredIngredients: measuredIngredient)
    }
}

@resultBuilder
enum SmoothieBuilder {
    
    static func buildBlock(_ description: AttributedString, _ components: MeasuredIngredient...) -> (AttributedString, [MeasuredIngredient]) {
        return (description, components)
    }

    @available(*, unavailable, message: "Description is a mandatory errors!")
    static func buildBlock( _ components: MeasuredIngredient...) -> (AttributedString, [MeasuredIngredient]) {
        fatalError("Description is a mandatory errors!")
    }
}

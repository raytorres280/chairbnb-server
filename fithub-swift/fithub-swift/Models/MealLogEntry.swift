//
//  MealLogEntry.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/15/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import Foundation

class MealLogEntry {
    let id: String!
    let meal: Meal!
    let mealType: String!
    
    init(id: String!, meal: Meal!, mealType: String!) {
        self.id = id
        self.meal = meal
        self.mealType = mealType
    }
}

//
//  MealModel.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/1/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import Foundation

class Meal {
    let id: String
    let name: String
    let calories: Int
    let proteins: Int
    let carbs: Int
    let fats: Int
    
    init(id: String, name: String, calories: Int, proteins: Int, carbs: Int, fats: Int) {
        self.id = id
        self.name = name
        self.calories = calories
        self.proteins = proteins
        self.carbs = carbs
        self.fats = fats
    }
}

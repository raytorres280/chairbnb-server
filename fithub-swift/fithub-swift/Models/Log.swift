//
//  LogModel.swift
//  fithub-swift
//
//  Created by Raymond Torres on 11/11/17.
//  Copyright © 2017 Raymond Torres. All rights reserved.
//

import Foundation

class Log {
    var id: String
//    var totalCalories: Float = 0.0
//    var totalProteins: Float = 0.0
//    var totalCarbs: Float = 0.0
//    var totalFats: Float = 0.0
//    var totalActivity: Float = 0
    var totalWater: Int = 0
    var meals: [String: Meal] = [:]
    let logDate: Date
    
    init(id: String, totalWater: Int?, logDate: Date = Date(), meals: [String: Meal]?) {
        self.id = id
        self.totalWater = (totalWater)!
        self.logDate = logDate
        self.meals = (meals)!
    }
    
    func calculateCalories() -> Int {
        return self.meals.reduce(0, { counter,meal in meal.value.calories + counter })
    }
    
    func calculateProteins() -> Int {
        return self.meals.reduce(0, { counter,meal in meal.value.proteins + counter })
    }
    
    func calculateCarbs() -> Int {
        return self.meals.reduce(0, { counter,meal in meal.value.carbs + counter })
    }
    
    func calculateFats() -> Int {
        return self.meals.reduce(0, { counter,meal in meal.value.fats + counter })
    }
    
}
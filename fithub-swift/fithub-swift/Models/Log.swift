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
    var meals: [MealLogEntry] = []
    let logDate: Date
    
    init(id: String, totalWater: Int?, logDate: Date = Date(), meals: [MealLogEntry]?) {
        self.id = id
        self.totalWater = (totalWater)!
        self.logDate = logDate
        self.meals = (meals)!
    }
    
    convenience init(log: LogsByUserIdQuery.Data.Log) {
        
        var meals = [MealLogEntry]()
        meals = log.meals!.map { mealLog in
            let meal = Meal(id: mealLog.meal.id, name: mealLog.meal.name, calories: mealLog.meal.calories, proteins: mealLog.meal.proteins, carbs: mealLog.meal.carbs, fats: mealLog.meal.fats)
            return MealLogEntry(id: mealLog.id, meal: meal, mealType: mealLog.mealType.map { $0.rawValue })
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateString = log.createdAt
        let date = dateFormatter.date(from: dateString)
        
        self.init(id: log.id, totalWater: log.totalWater, logDate: date!, meals: meals)
    }
    convenience init(log: CreateLogMutation.Data.Log) {

        var meals = [MealLogEntry]()
        meals = log.meals!.map { mealLog in
            let meal = Meal(id: mealLog.meal.id, name: mealLog.meal.name, calories: mealLog.meal.calories, proteins: mealLog.meal.proteins, carbs: mealLog.meal.carbs, fats: mealLog.meal.fats)
            return MealLogEntry(id: mealLog.id, meal: meal, mealType: mealLog.mealType.map { $0.rawValue })
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateString = log.createdAt
        let date = dateFormatter.date(from: dateString)
        
        self.init(id: log.id, totalWater: log.totalWater, logDate: date!, meals: meals)
    }
    
    func calculateCalories() -> Int {
        print(self.meals.count, "line 30")
        return self.meals.reduce(0, { counter,meal in meal.meal.calories + counter })
    }
    
    func calculateProteins() -> Int {
        return self.meals.reduce(0, { counter,meal in meal.meal.proteins + counter })
    }
    
    func calculateCarbs() -> Int {
        return self.meals.reduce(0, { counter,meal in meal.meal.carbs + counter })
    }
    
    func calculateFats() -> Int {
        return self.meals.reduce(0, { counter,meal in meal.meal.fats + counter })
    }
    
}

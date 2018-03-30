//
//  LogModel.swift
//  fithub-swift
//
//  Created by Raymond Torres on 11/11/17.
//  Copyright © 2017 Raymond Torres. All rights reserved.
//

import Foundation

class Log {
    var id: Int = 0
    var totalCalories: Float = 0.0
    var totalProteins: Float = 0.0
    var totalCarbs: Float = 0.0
    var totalFats: Float = 0.0
    var totalActivity: Float = 0
    var totalWater: Int = 0
    let logDate: Date
    init(id: Int, totalCalories: Float?, totalProteins: Float, totalCarbs: Float, totalFats: Float, totalActivity: Float, totalWater: Int, logDate: Date = Date()) {
        self.id = id
        self.totalCalories = totalCalories!
        self.totalProteins = totalProteins
        self.totalCarbs = totalCarbs
        self.totalFats = totalFats
        self.totalActivity = totalActivity
        self.totalWater = totalWater
        self.logDate = logDate
    }
}

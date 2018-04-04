//
//  CircleModel.swift
//  fithub-swift
//
//  Created by Raymond Torres on 11/10/17.
//  Copyright © 2017 Raymond Torres. All rights reserved.
//

import Foundation

class Circle {
    private var radius: Double
    
    init(radius: Double) {
        print("'entered constructor for circle..'");
        self.radius = radius;
    }
    
    func roll() {
        print("circle is rolling down the hill..");
    }
}

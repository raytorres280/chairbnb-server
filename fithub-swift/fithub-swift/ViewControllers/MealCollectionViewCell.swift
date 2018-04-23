//
//  MealCollectionViewCell.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/12/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var proteinsProgress: UIProgressView!
    @IBOutlet weak var carbsProgress: UIProgressView!
    @IBOutlet weak var fatsProgress: UIProgressView!
    var meal: Meal?
    override var isSelected: Bool{
        didSet {
            addMeal()
        }
    }
    func updateCellData(meal: Meal!) {
        print("updating data")
//        print(meal.name!)
        self.meal = meal
        mealName.text = meal.name
//        proteinsProgress.progress = Float(meal.proteins!)
//        carbsProgress.progress = Float(meal.carbs!)
//        fatsProgress.progress = Float(meal.fats!)
//        print(mealName.text)
//        print(meal.proteins)
    }
    
    private func addMeal() {
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main )
        APIService.addMealToLog(mealId: self.meal!.id)
    }
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("does this detect taps..?")
    }
}

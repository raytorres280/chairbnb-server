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
    override var isSelected: Bool{
        didSet {
            addMeal()
        }
    }
    func updateCellData(meal: Meal!) {
        print("updating data")
//        print(meal.name!)
        mealName.text = meal.name
//        proteinsProgress.progress = Float(meal.proteins!)
//        carbsProgress.progress = Float(meal.carbs!)
//        fatsProgress.progress = Float(meal.fats!)
//        print(mealName.text)
//        print(meal.proteins)
    }
    
    private func addMeal() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main )
        guard let navController = storyboard.instantiateViewController(withIdentifier: "AddMealNavigation") as? UINavigationController else {
            return
        }
        
        //do a graphQL post.
        //after returning, either update the chart with new data, or if it did not work add nothing and return to VC
        print("trying to pop")
//        storyboard.
        print(navController.topViewController)
        print(navController.viewControllers)
        print(navController.visibleViewController)
//        navController.popViewController(animated: true)
        navController.popToRootViewController(animated: false)
//        navController.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
}

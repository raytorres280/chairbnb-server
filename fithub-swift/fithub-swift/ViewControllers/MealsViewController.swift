//
//  MealsViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/11/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class MealsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBAction func cancelBtnPress(_ sender: Any) { navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mealsCollection: UICollectionView!
    @IBOutlet weak var segments: UISegmentedControl!
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealsCollection.dataSource = self
        mealsCollection.delegate = self
        fetchMeals()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var type: MEALTYPE
        switch segments.selectedSegmentIndex {
        case 0:
            type = MEALTYPE.breakfast
        case 1:
            type = MEALTYPE.lunch
        case 2:
            type = MEALTYPE.dinner
        case 3:
            type = MEALTYPE.snack
        default:
            type = MEALTYPE.snack
        }
        let item = mealsCollection.cellForItem(at: indexPath) as! MealCollectionViewCell
        APIService.addMealToLog(mealId: item.meal?.id, type: type)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of anyd resources that can be recreated.
    }
    
    private func fetchMeals() {
        apollo.fetch(query: MealsQuery()) { (result, err) in
            let meals = result?.data?.meals.map { meal -> Meal in
                return Meal(id: meal.id, name: meal.name, calories: meal.calories, proteins: meal.proteins, carbs: meal.carbs, fats: meal.fats)
            }
            if (meals != nil) {
                self.meals = meals!
                self.mealsCollection.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mealsCollection.dequeueReusableCell(withReuseIdentifier: "mealCell", for: indexPath) as! MealCollectionViewCell
        cell.updateCellData(meal: self.meals[indexPath.row])
        return cell
    }
}

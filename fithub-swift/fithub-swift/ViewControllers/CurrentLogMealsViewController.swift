//
//  CurrentLogMealsViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/24/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

//class MealEntryCell: UITableViewCell {
//
//    @IBOutlet weak var nameLabel: UILabel!
//
//}

class CurrentLogMealsViewController: UITableViewController {

    var meals = [MealLogEntryDetails]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    let sections = ["Breakfast", "Lunch", "Dinner", "Snacks"]
    var breakfastEntries = [MealLogEntryDetails]()
    var lunchEntries = [MealLogEntryDetails]()
    var dinnerEntries = [MealLogEntryDetails]()
    var snacksEntries = [MealLogEntryDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        meals = APIService.activeMeals
        createListsForCategories(meals: self.meals)
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }

    private func createObservers() {
        let didUpdateMealEntries = Notification.Name(rawValue: "did.update.meal.entries")
        NotificationCenter.default.addObserver(self, selector: #selector(self.onObserverActionTrigger(notification:)), name: didUpdateMealEntries, object: nil)
    }
    
    @objc func onObserverActionTrigger(notification: NSNotification) {
        print("observer detected update successfully.")
        self.meals = APIService.activeMeals
        createListsForCategories(meals: self.meals)
    }
    
    private func createListsForCategories(meals: [MealLogEntryDetails]) {
        breakfastEntries = meals.filter({item in item.mealType == MEALTYPE.breakfast})
        lunchEntries = meals.filter({item in item.mealType == MEALTYPE.lunch})
        dinnerEntries = meals.filter({item in item.mealType == MEALTYPE.breakfast})
        snacksEntries = meals.filter({item in item.mealType == MEALTYPE.snack})
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = sections[section]
        label.textColor = UIColor(named: "blue")
        return label
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4 //breakfast, lunch, dinner, snack
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return self.meals.count
        } else {
            switch sections[section] {
            case "Breakfast":
                return breakfastEntries.count
            case "Lunch":
                return lunchEntries.count
            case "Dinner":
                return dinnerEntries.count
            case "Snacks":
                return snacksEntries.count
            default:
                return self.meals.count
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "hello from cell \(indexPath)"
        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

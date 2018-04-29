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

    
    let sections = ["Breakfast", "Lunch", "Dinner", "Snacks"]
    var breakfastEntries = [MealLogEntryDetails]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    var lunchEntries = [MealLogEntryDetails]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    var dinnerEntries = [MealLogEntryDetails]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    var snacksEntries = [MealLogEntryDetails]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        createListsForCategories(meals: APIService.activeMeals)
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }

    private func createObservers() {
        let didUpdateMealEntries = Notification.Name(rawValue: "did.update.meal.entries")
        NotificationCenter.default.addObserver(self, selector: #selector(self.onObserverActionTrigger(notification:)), name: didUpdateMealEntries, object: nil)
    }
    
    @objc func onObserverActionTrigger(notification: NSNotification) {
        print("observer detected update successfully.")
        createListsForCategories(meals: APIService.activeMeals)
    }
    
    private func createListsForCategories(meals: [MealLogEntryDetails]) {
        breakfastEntries = meals.filter({item in item.mealType == MEALTYPE.breakfast})
        lunchEntries = meals.filter({item in item.mealType == MEALTYPE.lunch})
        dinnerEntries = meals.filter({item in item.mealType == MEALTYPE.dinner})
        snacksEntries = meals.filter({item in item.mealType == MEALTYPE.snack})
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var meal: MealLogEntryDetails
            switch sections[indexPath.section] {
            case "Breakfast":
                meal = breakfastEntries.remove(at: indexPath.row)
            case "Lunch":
                meal = lunchEntries.remove(at: indexPath.row)
            case "Dinner":
                meal = dinnerEntries.remove(at: indexPath.row)
            case "Snacks":
                meal = snacksEntries.remove(at: indexPath.row)
            default:
                print("error with removing meal from correct section")
                return
            }
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            APIService.removeMealFromLog(mealEntryId: meal.id)
        }
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
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        var entry: MealLogEntryDetails
        switch sections[indexPath.section] {
        case "Breakfast":
            entry = breakfastEntries[indexPath.row]
        case "Lunch":
            entry = lunchEntries[indexPath.row]
        case "Dinner":
            entry = dinnerEntries[indexPath.row]
        case "Snacks":
            entry = snacksEntries[indexPath.row]
        default:
            entry = breakfastEntries[indexPath.row]
            print("error finding section for cell")
        }
        cell.textLabel?.text = "Name: \(entry.meal.name), id: \(entry.id)"
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

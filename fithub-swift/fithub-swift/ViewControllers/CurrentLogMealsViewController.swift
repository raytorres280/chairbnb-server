//
//  CurrentLogMealsViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/24/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit

class CurrentLogMealsViewController: UITableViewController {

    var meals = [MealLogEntryDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meals = APIService.activeMeals
        // Do any additional setup after loading the view.
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

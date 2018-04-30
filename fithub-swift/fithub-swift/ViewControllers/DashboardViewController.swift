//
//  DashboardViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/11/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit
import Apollo

let activeLogUpdateKey = "did.update.active.log"
class DashboardViewController: UIViewController {
    
    var currentLog: LogDetails? = nil
    var anotherTest: String?
    
    @IBAction func waterStepper(_ sender: UIStepper) {
        print(sender.value)
        self.waterIntake = Int(sender.value)
        waterProgress.progress = Float(sender.value) / 64
    }
    @IBOutlet weak var progress: MKRingProgressGroupView!
    
    @IBOutlet weak var caloriesProgress: UIProgressView!
    @IBOutlet weak var waterProgress: UIProgressView!
    @IBOutlet weak var caloriesBurnedProgress: UIProgressView!
    
    var proteins: Int = 0
    var carbs: Int = 0
    var fats: Int = 0
    var caloriesConsumed: Int = 0
    var caloriesBurned: Int = 0
    var waterIntake: Int = 0
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        createObservers()
        styleProgressRings()
        self.currentLog = APIService.activeLog
        if(self.currentLog != nil) {
            calculateMacros()
            calculateProgress()
        }

    }
    
    private func createObservers() {
        let didUpdateLogs = Notification.Name(rawValue: "did.update.logs")
        let didUpdateMeals = Notification.Name(rawValue: "did.update.meal.entries")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.onNewActiveLog(notification:)), name: didUpdateLogs, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onActiveMealsUpdate(notification:)), name: didUpdateMeals, object: nil)
    }
    
    @objc func onNewActiveLog(notification: NSNotification) {
        print("observer detected update successfully.")
        self.currentLog = APIService.activeLog
        calculateMacros()
        calculateProgress()
        
    }
    
    @objc func onActiveMealsUpdate(notification: NSNotification) {
        calculateMacros()
        calculateProgress()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func calculateMacros() -> Void {
        self.proteins = APIService.activeMeals.reduce(0, {(counter, item) in
            return item.meal.proteins + counter
        })
        self.carbs = APIService.activeMeals.reduce(0, {(counter, item) in
            return item.meal.carbs + counter
        })
        
        self.fats = APIService.activeMeals.reduce(0, {(counter, item) in
            return item.meal.carbs + counter
        })
        
        self.caloriesConsumed = APIService.activeMeals.reduce(0, {(counter, item) in
            return item.meal.calories + counter
        })
        
        self.waterIntake = APIService.activeLog!.totalWater!
    }
    
    private func styleProgressRings() -> Void {
        //proteins
        progress.ring1.startColor = UIColor.cyan
        progress.ring1.endColor = UIColor.cyan
        //carbs
        progress.ring2.startColor = UIColor.magenta
        progress.ring2.endColor = UIColor.magenta
        //fats
        progress.ring3.startColor = UIColor.yellow
        progress.ring3.endColor = UIColor.yellow
    }
    
    private func calculateProgress() -> Void {
        progress.ring1.progress = Double(proteins) / 100
        progress.ring2.progress = Double(carbs) / 200
        progress.ring3.progress = Double(fats) / 50
        waterProgress.progress = Float((self.currentLog?.totalWater)!) / 64
        caloriesBurnedProgress.progress = Float((self.currentLog?.caloriesBurned)!) / 300
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

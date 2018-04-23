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
    
    @IBOutlet weak var progress: MKRingProgressGroupView!
    
    @IBOutlet weak var caloriesProgress: UIProgressView!
    @IBOutlet weak var waterProgress: UIProgressView!
    @IBOutlet weak var caloriesBurnedProgress: UIProgressView!
    
    var proteins: Int = 0
    var carbs: Int = 0
    var fats: Int = 0
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("dashboard loaded")
        self.navigationController?.isNavigationBarHidden = true
        print(APIService.activeLog)
        print(APIService.sharedInstance.logs)
        // Do any additional setup after loading the view.
        self.currentLog = APIService.activeLog
        //proteins
        progress.ring1.startColor = UIColor(red:0.75, green:0.26, blue:0.26, alpha:1.0)
        //carbs
        progress.ring2.startColor = UIColor(red:0.61, green:0.77, blue:0.24, alpha:1.0)
        //fats
        progress.ring3.startColor = UIColor(red:0.99, green:0.91, blue:0.30, alpha:1.0)
        
        if(self.currentLog != nil) {
            progress.ring1.progress = Double(proteins) / 100
            progress.ring2.progress = Double(carbs) / 200
            progress.ring3.progress = Double(fats) / 50
        }
        
        waterProgress.progress = Float((self.currentLog?.totalWater)!) / 64
        caloriesBurnedProgress.progress = Float((self.currentLog?.caloriesBurned)!) / 300
//        caloriesProgress.progress = Float((self.currentLog?.caloriesBurned)!) / 300
    }
    
    func createObservers() {
        let didUpdateLogs = Notification.Name(rawValue: "did.update.logs")
        NotificationCenter.default.addObserver(self, selector: #selector(self.onObserverActionTrigger(notification:)), name: didUpdateLogs, object: nil)
    }
    
    @objc func onObserverActionTrigger(notification: NSNotification) {
        print("observer detected update successfully.")
        self.currentLog = APIService.activeLog
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

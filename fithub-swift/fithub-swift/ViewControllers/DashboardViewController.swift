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
    
    var currentLog: LogDetails?
    var logTest: GraphQLQueryWatcher<LogsByUserIdQuery>?
    var anotherTest: String?
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("dashbaord loaded")
        self.navigationController?.isNavigationBarHidden = true
        apollo.watch(query: LogsByUserIdQuery(id: "cjg8rogq7003l0131j3ue2vbs")) { (res, err) in
            print("updated")
            print(res?.data?.logs.count)
            //should be latest date
            print(res?.data?.logs[0].createdAt)
            
        }
        print(APIService.activeLog)
        print(APIService.sharedInstance.logs)
        // Do any additional setup after loading the view.
    }
    
    func createObservers() {
        let didUpdateLogs = Notification.Name(rawValue: "did.update.logs")
        NotificationCenter.default.addObserver(self, selector: #selector(self.onObserverActionTrigger(notification:)), name: didUpdateLogs, object: nil)
    }
    
    @objc func onObserverActionTrigger(notification: NSNotification) {
        print("observer detected update successfully.")
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

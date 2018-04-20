//
//  DashboardViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/11/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit
import Apollo

let activeLogUpdateKey = "active.log.update.data"
class DashboardViewController: UIViewController {
    
    var currentLog: LogDetails?
    var logTest: GraphQLQueryWatcher<LogsByUserIdQuery>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        apollo.watch(query: LogsByUserIdQuery(id: "cjg0qieg700by01310xm40jxh")) { (res, err) in
            print("updated")
            print(res?.data?.logs.count)
            
        }
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

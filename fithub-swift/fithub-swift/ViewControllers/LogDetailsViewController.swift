//
//  LogDetailsViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/6/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit
import Charts
import MKRingProgressView

class LogDetailsViewController: UIViewController {
    
    @IBOutlet weak var logIdLabel: UILabel!
    
    
    @IBOutlet weak var macrosProgress: MKRingProgressGroupView!
    var log: LogDetails?
    var proteins: Int = 0
    var carbs: Int = 0
    var fats: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("details loaded")
        logIdLabel.text = log!.createdAt
        
        //proteins
        macrosProgress.ring1.startColor = UIColor(red:0.75, green:0.26, blue:0.26, alpha:1.0)
        //carbs
        macrosProgress.ring2.startColor = UIColor(red:0.61, green:0.77, blue:0.24, alpha:1.0)
        //fats
        macrosProgress.ring3.startColor = UIColor(red:0.99, green:0.91, blue:0.30, alpha:1.0)
        
        macrosProgress.ring1.progress = Double(proteins) / 100
        macrosProgress.ring2.progress = Double(carbs) / 200
        macrosProgress.ring3.progress = Double(fats) / 50
        
        
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

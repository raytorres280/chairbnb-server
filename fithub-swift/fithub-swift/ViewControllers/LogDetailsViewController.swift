//
//  LogDetailsViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/6/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import UIKit
import Charts

class LogDetailsViewController: UIViewController {
    
    @IBOutlet weak var logIdLabel: UILabel!
    @IBOutlet weak var macrosChart: PieChartView!
    var log: Log?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("details loaded")
        // Do any additional setup after loading the view.
        logIdLabel.text = log!.id
        
        let dataEntries = [PieChartDataEntry(value: Double(self.log!.calculateProteins()), label: "proteins"), PieChartDataEntry(value: Double(self.log!.calculateCarbs()), label: "carbs"), PieChartDataEntry(value: Double(self.log!.calculateFats()), label: "fats")]
        let chartDataSet = PieChartDataSet(values: dataEntries, label: "Macros")
        let chartData = PieChartData(dataSet: chartDataSet)

        let colors = [UIColor.red, UIColor.blue, UIColor.purple]
        chartDataSet.colors = colors
        macrosChart.frame.size = CGSize(width: 300, height: 300)
        macrosChart.holeRadiusPercent = CGFloat(0.37)
        macrosChart.data = chartData
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

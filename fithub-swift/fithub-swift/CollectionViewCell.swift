//
//  CollectionViewCell.swift
//  
//
//  Created by Raymond Torres on 3/31/18.
//

import UIKit
import Charts

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var logDateLabel: UILabel!
    var proteins: Int = 0
    var carbs: Int = 0
    var fats: Int = 0
    
    func updateCellData() {
//        var dataEntries = [PieChartDataEntry(value: Double(self.proteins), label: "proteins"), PieChartDataEntry(value: Double(self.carbs), label: "carbs"), PieChartDataEntry(value: Double(self.fats), label: "fats")]
//        let chartDataSet = PieChartDataSet(values: dataEntries, label: "Macros")
//        let chartData = PieChartData(dataSet: chartDataSet)
//
//        let colors = [UIColor.red, UIColor.blue, UIColor.purple]
//        chartDataSet.colors = colors as! [NSUIColor]
//        chart.frame.size = CGSize(width: 150, height: 150)
//        self.chart.data = chartData
        print("updating cell data...")
//        print(self.proteins)
        
        
        
    }
}

//
//  CollectionViewCell.swift
//  
//
//  Created by Raymond Torres on 3/31/18.
//

import UIKit
import FoldingCell

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var carbsProgress: UIProgressView!
    @IBOutlet weak var logDateLabel: UILabel!
    @IBOutlet weak var proteinsProgress: UIProgressView!
    @IBOutlet weak var fatsProgress: UIProgressView!
    
    
    var proteins: Int = 0
    var carbs: Int = 0
    var fats: Int = 0
    var log: LogDetails?
    
    
    func updateCellData(log: LogDetails) {
        self.log = log
        self.proteins = log.meals!.reduce(0, { $0 + $1.meal.proteins })
        self.carbs = log.meals!.reduce(0, { $0 + $1.meal.carbs })
        self.fats = log.meals!.reduce(0, { $0 + $1.meal.fats })
        
        print("updating cell data...")
        // update ui progress views here with prop values..
        logDateLabel.text = log.createdAt
        
        proteinsProgress.progressTintColor = UIColor.blue
        carbsProgress.progressTintColor = UIColor.red
        fatsProgress.progressTintColor = UIColor.yellow
        
        proteinsProgress.progress = Float(self.proteins) / 100
        carbsProgress.progress = Float(self.carbs) / 200
        fatsProgress.progress = Float(self.fats) / 50
        
    }
}

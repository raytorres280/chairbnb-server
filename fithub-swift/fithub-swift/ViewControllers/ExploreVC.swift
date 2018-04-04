//
//  ExploreVC.swift
//  fithub-swift
//
//  Created by Raymond Torres on 12/3/17.
//  Copyright © 2017 Raymond Torres. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ExploreVC: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBOutlet weak var logCollection: UICollectionView!
    var logs = [Log]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("listview loaded..")
        
        logCollection.dataSource = self
        
        let newView = UIView()
        newView.backgroundColor = UIColor.blue
        
        //fetch logs from graphQL server API
        fetchLogs()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = logCollection.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CollectionViewCell
        cell.logDateLabel.text = logs[0].logDate.description
        cell.proteins = logs[0].calculateProteins()
        cell.carbs = logs[0].calculateCarbs()
        cell.fats = logs[0].calculateFats()
        cell.updateCellData()
        return cell
    }
    
    func fetchLogs() {
        apollo.fetch(query: LogsByUserIdQuery(id: "cjfk3c62o00bj0131quztynkn")) { (result, err) in
            print("came back from first swift query!")
            print(result!.data!.logs)
            let logs = result?.data?.logs.map {log -> Log in
                
                //create date obj from date str
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let dateString = log.createdAt
                let date = dateFormatter.date(from: dateString)
                
                //format Log.meals from query data
                var meals = [String: Meal]()
                print(log.meals!.count)
                log.meals.map { meal in
                    print(meal[0].id, "line 61")
                    meals[meal[0].id] = Meal(id: meal[0].id, name: meal[0].name, calories: meal[0].calories!, proteins: meal[0].proteins!, carbs: meal[0].carbs!, fats: meal[0].fats!)
                }
                return Log(id: log.id, totalWater: log.totalWater, logDate: date!, meals: meals)
            }
            self.logs = logs!
            self.logCollection.reloadData()
        }
    }
}


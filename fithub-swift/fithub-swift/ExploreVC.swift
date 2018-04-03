//
//  ExploreVC.swift
//  fithub-swift
//
//  Created by Raymond Torres on 12/3/17.
//  Copyright © 2017 Raymond Torres. All rights reserved.
//

import Foundation
import UIKit

class ExploreVC: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBAction func onButtonPress(_ sender: Any) {
        print("hello world!")
    }
    @IBOutlet weak var logCollection: UICollectionView!
    var logs = [Log]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("listview loaded..")
        
        logCollection.dataSource = self
        
        let newView = UIView()
        newView.backgroundColor = UIColor.blue
        
        apollo.fetch(query: LogsByUserIdQuery(id: "cjfhzy3j500630131ccrr3t8y")) { (result, err) in
            print("came back from first swift query!")
            print((result?.data?.logs[0])!)
            let logs = result?.data?.logs.map {log -> Log in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                print(log.createdAt)
                let dateString = log.createdAt
                let date = dateFormatter.date(from: dateString)
                print(date!)
                var meals = [String: Meal]()
                log.meals.map {meal in
                    print(meal[0].id)
                    meals[meal[0].id] = Meal(id: meal[0].id, name: meal[0].name, calories: meal[0].calories!, proteins: meal[0].proteins!, carbs: meal[0].carbs!, fats: meal[0].fats!)
                }
                return Log(id: log.id, totalWater: log.totalWater, logDate: date!, meals: meals)
            }
            self.logs = logs!
            self.logCollection.reloadData()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = logCollection.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CollectionViewCell
        cell.logLabel.text = logs[0].logDate.description
        return cell
    }
}

extension String
{
    func toDate( dateFormat format  : String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter.date(from: self)!
    }
    
}

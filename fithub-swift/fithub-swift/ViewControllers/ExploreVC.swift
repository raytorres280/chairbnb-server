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

class ExploreVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let senderVC = sender as! CollectionViewCell
        let destinationVC = segue.destination as! LogDetailsViewController
        print(destinationVC)
        destinationVC.log = senderVC.log
        //set the log, let VC do the rest after load.
    }
    override func viewWillAppear(_ animated: Bool) {
        //hide navbar on list view
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //show nav with back on details, when list disappears.
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = logCollection.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CollectionViewCell
        cell.updateCellData(log: logs[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected a log in list", indexPath)
        
    }
    
    func fetchLogs() {
        apollo.fetch(query: LogsByUserIdQuery(id: "cjfk3c62o00bj0131quztynkn")) { (result, err) in
            let logs = result?.data?.logs.map {log -> Log in
                //create date obj from date str
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let dateString = log.createdAt
                let date = dateFormatter.date(from: dateString)
                
                //format Log.meals from query data
                var meals = [Meal]()
                //wtf happened here? why? [map{}!]
                meals = log.meals!.map { meal in
                    return Meal(id: meal.id, name: meal.name, calories: meal.calories!, proteins: meal.proteins!, carbs: meal.carbs!, fats: meal.fats!)
                    }
                return Log(id: log.id, totalWater: log.totalWater, logDate: date!, meals: meals)
            }
            self.logs = logs!
            self.logCollection.reloadData()
        }
    }
}


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
import Apollo

//let logsUpdateKey = "logs.update.data"
class ExploreVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBOutlet weak var logCollection: UICollectionView!
    var logTest: GraphQLQueryWatcher<LogsByUserIdQuery>?
    var logs = [LogDetails]() {
        didSet {
            self.logCollection.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("listview loaded..")
        
        logCollection.dataSource = self
        
        let newView = UIView()
        newView.backgroundColor = UIColor.blue
        
        //fetch logs from graphQL server API
        print(APIService.activeLog)
        print(APIService.sharedInstance.logs)
        self.logs = APIService.sharedInstance.logs
        createObservers()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func createObservers() {
        let didUpdateLogs = Notification.Name(rawValue: "did.update.logs")
        NotificationCenter.default.addObserver(self, selector: #selector(ExploreVC.onObserverActionTrigger(notification:)), name: didUpdateLogs, object: nil)
    }
    @objc func onObserverActionTrigger(notification: NSNotification) {
        print("observer detected update successfully.")
        print(APIService.sharedInstance.logs)
        self.logs = APIService.sharedInstance.logs
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let senderVC = sender as! CollectionViewCell
        let destinationVC = segue.destination as! LogDetailsViewController
        destinationVC.log = senderVC.log!
        destinationVC.proteins = senderVC.proteins
        destinationVC.carbs = senderVC.carbs
        destinationVC.fats = senderVC.fats
    }
    override func viewWillAppear(_ animated: Bool) {
        //hide navbar on list view
        navigationController?.setNavigationBarHidden(true, animated: false)
//        fetchLogs()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //show nav with back on details, when list disappears.
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.logs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = logCollection.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CollectionViewCell
//        print(logs[indexPath.row])
        cell.updateCellData(log: logs[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected a log in list", indexPath)
        
    }
    
    func fetchLogs() {
        //TODO: move function to log service.
        
        //change id later when auth is done
        apollo.fetch(query: LogsByUserIdQuery(id: "cjg8rogq7003l0131j3ue2vbs")) { (result, err) in
            guard let logs = result?.data?.logs else {
                return
            }
            print(logs.count)
            let now = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            //check latest against current date
            let dateString = logs[0].createdAt
            let date = dateFormatter.date(from: dateString)
            
            if(!NSCalendar.current.isDate(now as Date, inSameDayAs: date!)) {
                print("this is not the current date. Create new log")
                self.logs = logs.map { $0.fragments.logDetails }
                self.createLog()
            } else {
                self.logs = logs.map { $0.fragments.logDetails }
                self.logCollection.reloadData()
            }
            
        }
    }
    
    func createLog() {
        //move this func to service
        
        
        let userId = "cjg8rogq7003l0131j3ue2vbs" //fetch from local storage later
        apollo.perform(mutation: CreateLogMutation(userId: userId)) {(result, err) in
            print("created new log check for update")
            print(result!.data!)
            guard let res = result?.data?.log else {
                return
            }
            self.logs.insert(res.fragments.logDetails, at: 0)
//            self.logCollection.reloadData()
            //move old active log to top of logs list
            //unnecessary if gql watcher is setup correctly.
            //                        apollo.fetch(query: LogsByUserIdQuery(id: "cjg8rogq7003l0131j3ue2vbs")) {(result, err) in
            //                            guard let logsVC = storyboard.instantiateViewController(withIdentifier: "LogsVC") as? ExploreVC else {
            //                                return
            //                            }
            //                            guard let logs = result?.data?.logs
            //                        }
            //make new log current active log.
            //                dashboardVC.currentLog = res.fragments.logDetails
        }
    }
}


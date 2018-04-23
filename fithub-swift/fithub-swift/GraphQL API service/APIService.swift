//
//  APIService.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/18/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import Foundation
//protocol Observer {
//    var id : Int{ get }
//    func update()
//}
class APIService {
    static let sharedInstance = APIService()
    var logs = [LogDetails]() {
        didSet {
            APIService.notify()
        }
    }
    static var activeLog: LogDetails?
    static var activeMeals: [MealLogEntryDetails]?
    
    private static func notify(){
        let name = Notification.Name(rawValue: "did.update.logs")
        NotificationCenter.default.post(name: name, object: nil)
        
        
    }
    static func fetchLogs(userId: String = "cjgbs9ch600760131g366xhab") {
        apollo.fetch(query: LogsByUserIdQuery(id: userId)) { (result, err) in
            guard let res = result?.data?.logs else {
                return
            }
            var logs = res.map {$0.fragments.logDetails}
            //check if latest log matches current date, if not do a create
            let now = NSDate()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let dateString = logs[0].createdAt
            let date = formatter.date(from: dateString)
            let active = logs.remove(at: 0)
            let meals = active.meals?.map {$0.fragments.mealLogEntryDetails}
            APIService.sharedInstance.logs = logs
            APIService.activeLog = active
            APIService.activeMeals = meals
            if(!NSCalendar.current.isDate(now as Date, inSameDayAs: date!)) {
                print("this is not the current date. Create new log")
                APIService.createLog()//chaining async in swift??????
            }
            
        }
        
    }
    
    static func createLog(userId: String = "cjgbs9ch600760131g366xhab") {
        apollo.perform(mutation: CreateLogMutation(userId: "cjgbs9ch600760131g366xhab")) { (result, err) in
            print(result!.data!)
            guard let res = result?.data?.log else {
                return
            }
            let log = res.fragments.logDetails
            APIService.activeLog = log
        }
    }
   
    static func addMealToLog(mealId: String!) {
        apollo.perform(mutation: AddMealEntryToLogMutation(id: APIService.activeLog!.id, mealId: mealId, mealType: MEALTYPE(rawValue: "BREAKFAST"))) { (result, err) in
            guard let res = result?.data?.addMealEntryToLog else {
                 return
            }
            let entry = res.fragments.mealLogEntryDetails
            APIService.activeMeals?.append(entry)
            
        }
    }
}

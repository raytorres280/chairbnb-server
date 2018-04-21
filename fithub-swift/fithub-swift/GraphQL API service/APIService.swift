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
    
    private static func notify(){
        let name = Notification.Name(rawValue: "did.update.logs")
        NotificationCenter.default.post(name: name, object: nil)
        
        
    }
    static func fetchLogs(userId: String = "cjg8rogq7003l0131j3ue2vbs") {
        apollo.fetch(query: LogsByUserIdQuery(id: userId)) { (result, err) in
            guard let res = result?.data?.logs else {
                return
            }
            let logs = res.map {$0.fragments.logDetails}
            //check if latest log matches current date, if not do a create
            print(logs[0].createdAt) //latest since descending
            let now = NSDate()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let dateString = logs[0].createdAt
            let date = formatter.date(from: dateString)
            APIService.sharedInstance.logs = logs
            
            if(!NSCalendar.current.isDate(now as Date, inSameDayAs: date!)) {
                print("this is not the current date. Create new log")
                //chaining async in swift??????
                self.createLog()
            }
            
        }
        
    }
    
    static func createLog(userId: String = "cjg8rogq7003l0131j3ue2vbs") {
        apollo.perform(mutation: CreateLogMutation(userId: "cjg8rogq7003l0131j3ue2vbs")) { (result, err) in
            print(result!.data!)
            guard let res = result?.data?.log else {
                return
            }
            let log = res.fragments.logDetails
            APIService.sharedInstance.logs.insert(log, at: 0)
            self.activeLog = log
        }
    }
}

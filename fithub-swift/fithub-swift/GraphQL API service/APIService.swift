//
//  APIService.swift
//  fithub-swift
//
//  Created by Raymond Torres on 4/18/18.
//  Copyright © 2018 Raymond Torres. All rights reserved.
//

import Foundation

class APIService {
    static let sharedInstance = APIService()
    static var logs = [Log]()
    static var activeLog = [Log]()
    static func fetchLogsByUserId(userId: String = "cjg0qieg700by01310xm40jxh") {
        apollo.fetch(query: LogsByUserIdQuery(id: userId)) { (result, err) in
            var logs = result?.data?.logs.map {log -> Log in
                return Log(log: log)
            }
            //check if latest log matches current date, if not do a create
            print(logs![0].logDate) //latest since descending
            let now = NSDate()
            if(!NSCalendar.current.isDate(now as Date, inSameDayAs: logs![0].logDate)) {
                print("this is not the current date. Create new log")
                //chaining async in swift??????
                self.createLog()
            } else {
                //set most recent log as active log
            }
            
        }
        
    }
    
    static func createLog(userId: String = "cjg0qieg700by01310xm40jxh") {
        apollo.perform(mutation: CreateLogMutation(userId: "cjg0qieg700by01310xm40jxh")) { (result, err) in
            print(result!.data!)
            guard let res = result?.data?.log else {
                return
            }
            let log = Log(log: res)
            
            //move old active log to top of logs list
            //make new log current active log.
        }
    }
}

//
//  Order.swift
//  chairbrb-apiPackageDescription
//
//  Created by Raymond Torres on 11/17/17.
//

import Vapor
import FluentProvider
import HTTP

final class Order: Model, PivotProtocol {
    let storage = Storage()

    var id: Node?
    var isComplete: BooleanLiteralType = false
    var daysRented: Int
    var coupon: String? = ""
    var total: Double?
    var userId: Identifier?
    var locationId: Identifier?

    //MARK: protocol
    static var entity = "order"

    typealias Left = User
    typealias Right = Location

    static var leftIdKey: String = Order.Keys.userId
     static var rightIdKey: String = Order.Keys.locationId
    var user: Parent<Order, User> {
                return parent(id: userId)
            }
    var location: Parent<Order, Location> {
        return parent(id: locationId)
    }

    struct Keys {
        static let id = "id"
        static let isComplete = "is_complete"
        static let daysRented = "days-rented"
        static let coupon = "coupon"
        static let total = "total"
        static let userId = "user_id"
        static let locationId = "location_id"
    }
    //make local
    init(isComplete: BooleanLiteralType?, daysRented: Int?, coupon: String?, total: Double?, user: User, location: Location) {
        self.isComplete = false
        self.daysRented = 0
        self.coupon = coupon
        self.total = 0
        self.userId = user.id
        self.locationId = location.id
    }
    //make from db row
    init(row: Row) throws {
        id = try row.get(Order.Keys.id)
        isComplete = try row.get(Order.Keys.isComplete)
        daysRented = try row.get(Order.Keys.daysRented)
        coupon = try row.get(Order.Keys.coupon)
        total = try row.get(Order.Keys.total)
        userId = try row.get(Order.Keys.userId)
        locationId = try row.get(Order.Keys.locationId)
    }

    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Order.Keys.isComplete, isComplete)
        try row.set(Order.Keys.daysRented, daysRented)
        try row.set(Order.Keys.coupon, coupon)
        try row.set(Order.Keys.total, total)
        try row.set(Order.Keys.userId, userId)
        try row.set(Order.Keys.locationId, locationId)
        return row
    }
}

//extension Order {
//    var user: Parent<Order, User> {
//        return parent(id: userId)
//    }
//}
//
//extension Order {
//    var location: Parent<Order, Location> {
//        return parent(id: locationId)
//    }
//}

extension Order: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.bool(Order.Keys.isComplete)
            builder.int(Order.Keys.daysRented)
            builder.string(Order.Keys.coupon, optional: true)
            builder.double(Order.Keys.total)
            builder.foreignId(for: Location.self)
            builder.foreignId(for: User.self)
        }
    }

    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}


extension Order: JSONConvertible {
   convenience init(json: JSON) throws {
     let userId: Identifier = try json.get("user_id")
     let locationId: Identifier = try json.get("location_id")
     guard let user = try User.find(userId) else {
       throw Abort.badRequest
     }
     guard let location = try Location.find(locationId) else {
       throw Abort.badRequest
     }
       self.init(
           isComplete: try json.get(Order.Keys.isComplete),
           daysRented: try json.get(Order.Keys.daysRented),
           coupon: try json.get(Order.Keys.coupon),
           total: try json.get(Order.Keys.total),
           user: user,
           location: location
       )
   }

   func makeJSON() throws -> JSON {
       var json = JSON()
       try json.set(Order.Keys.id, id)
       try json.set(Order.Keys.isComplete, isComplete)
       try json.set(Order.Keys.daysRented, daysRented)
       try json.set(Order.Keys.coupon, coupon)
       try json.set(Order.Keys.total, total)
       try json.set(Order.Keys.userId, userId)
       try json.set(Order.Keys.locationId, locationId)
       return json
   }
}

extension Order: ResponseRepresentable { }

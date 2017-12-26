//
//  Location.swift
//  chairbrb-apiPackageDescription
//
//  Created by Raymond Torres on 11/17/17.
//

import Vapor
import FluentProvider
import HTTP

final class Location: Model {
    let storage = Storage()
    var id: Identifier?
    var street: String
    var street2: String
    var city: String
    var state: String
    var zip: String
    var avgReview: Float // calc based off ratings arr below.
    var ratings: Int // review relationship. 1:n
    var rate: Float //money
    var chair: String
    var hostId: Identifier?


//    var host: Parent<Location, Host> {
//        return parent(id: hostId)
//    }

    struct Keys {
        static let id = "id"
        static let street = "street"
        static let street2 = "street2"
        static let city = "city"
        static let state = "state"
        static let zip = "zip"
        static let rate = "rate"
        static let ratings = "ratings"
        static let avgReview = "avgReview"
        static let chair = "chair"
        static let hostId = "host_id"
    }

    //create locally
    init(street: String, street2: String, city: String, state: String, zip: String, rate: Float, chair: String, host: Host) {
        self.street = street
        self.street2 = street2
        self.city = city
        self.state = state
        self.zip = zip
        self.avgReview = 0
        self.ratings = 0
        self.rate = rate
        self.chair = chair
        self.hostId = host.id
    }

    //make obj from returned db row
    init(row: Row) throws {
        street = try row.get(Location.Keys.street)
        street2 = try row.get(Location.Keys.street2)
        city = try row.get(Location.Keys.city)
        state = try row.get(Location.Keys.state)
        zip = try row.get(Location.Keys.zip)
        rate = try row.get(Location.Keys.rate)
        ratings = try row.get(Location.Keys.ratings)
        chair = try row.get(Location.Keys.chair)
        avgReview = try row.get(Location.Keys.avgReview)
        hostId = try row.get(Location.Keys.hostId)
    }

    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Location.Keys.street, street)
        try row.set(Location.Keys.street2, street2)
        try row.set(Location.Keys.city, city)
        try row.set(Location.Keys.state, state)
        try row.set(Location.Keys.zip, zip)
        try row.set(Location.Keys.rate, rate)
        try row.set(Location.Keys.ratings, ratings)
        try row.set(Location.Keys.chair, chair)
        try row.set(Location.Keys.avgReview, avgReview)
        try row.set(Location.Keys.hostId, hostId)
        return row
    }
}

extension Location: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string(Location.Keys.street)
            builder.string(Location.Keys.street2)
            builder.string(Location.Keys.city)
            builder.string(Location.Keys.state)
            builder.string(Location.Keys.zip)
            builder.double(Location.Keys.rate)
            builder.int(Location.Keys.ratings)
            builder.string(Location.Keys.chair)
            builder.double(Location.Keys.avgReview)
            builder.foreignId(for: Host.self)
        }
    }

    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension Location: JSONConvertible {
    convenience init(json: JSON) throws {
        let hostId: Identifier = try json.get("host_id")
        guard let host = try Host.find(hostId) else {
            throw Abort.badRequest
        }
        self.init(
            street: try json.get(Location.Keys.street),
            street2: try json.get(Location.Keys.street2),
            city: try json.get(Location.Keys.city),
            state: try json.get(Location.Keys.state),
            zip: try json.get(Location.Keys.zip),
            rate: try json.get(Location.Keys.rate),
            chair: try json.get(Location.Keys.chair),
            host: host
        )
    }

    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Location.Keys.id, id)
        try json.set(Location.Keys.street, street)
        try json.set(Location.Keys.street2, street2)
        try json.set(Location.Keys.city, city)
        try json.set(Location.Keys.state, state)
        try json.set(Location.Keys.zip, zip)
        try json.set(Location.Keys.rate, rate)
        try json.set(Location.Keys.ratings, ratings)
        try json.set(Location.Keys.chair, chair)
        try json.set(Location.Keys.avgReview, avgReview)
        try json.set(Location.Keys.hostId, hostId)
        return json
    }
}

extension Location: ResponseRepresentable { }

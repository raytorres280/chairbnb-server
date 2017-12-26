//
//  Review.swift
//  chairbrb-apiPackageDescription
//
//  Created by Raymond Torres on 11/17/17.
//

import Vapor
import FluentProvider
import HTTP

final class Review: Model {
    let storage = Storage()
    
    var id: Node?
    var review: Int
    
    struct Keys {
        static let id = "id"
        static let review = "review"
    }
    //create local
    init(id: Node?, review: Int) {
        self.review = review
    }
    //create from table row
    init(row: Row) throws {
        id = try row.get(Review.Keys.id)
        review = try row.get(Review.Keys.review)
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Review.Keys.id, id)
        try row.set(Review.Keys.review, review)
        return row
    }
}

extension Review: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.int(Review.Keys.review)
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension Review: JSONConvertible {
    convenience init(json: JSON) throws {
        self.init(
            id: try json.get(Review.Keys.id),
            review: try json.get(Review.Keys.review)
        )
        
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Review.Keys.id, id)
        try json.set(Review.Keys.review, review)
        return json
    }
}

extension Review: ResponseRepresentable { }

//
//  Photo.swift
//  chairbrb-apiPackageDescription
//
//  Created by Raymond Torres on 11/17/17.
//
import Vapor
import FluentProvider
import HTTP

final class Photo: Model {
    let storage = Storage()
    
    var id: Node?
    var photo: Node?
    
    struct Keys {
        static let id = "id"
        static let photo = "photo"
    }
    
    init(photo: Node?) {
        self.photo = photo
    }
    
    //create from db row..
    init(row: Row) throws {
        id = try row.get(Photo.Keys.id)
        photo = try row.get(Photo.Keys.photo)
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Photo.Keys.id, id)
        try row.set(Photo.Keys.photo, photo)
        return row
    }
}

extension Photo: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.bytes(Photo.Keys.photo)
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

//extension Photo: JSONConvertible {
//    convenience init(json: JSON) throws {
//        self.init(
//            id: try json.get(Photo.Keys.id),
//            photo: try json.get(Photo.Keys.photo)
//        )
//    }
//
//    func makeJSON() throws -> JSON {
//        var json = JSON()
//        try json.set(Photo.Keys.id, id)
//        try json.set(Photo.Keys.photo, photo)
//        return json
//    }
//}

//extension Photo: ResponseRepresentable { }


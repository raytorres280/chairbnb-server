//
//  UserController.swift
//  chairbrb-apiPackageDescription
//
//  Created by Raymond Torres on 11/17/17.
//

import Vapor
import HTTP

final class UserController: ResourceRepresentable {
    
    
    // /GET to /users, return all users
    func index(_ req: Request) throws -> ResponseRepresentable {
        return try User.all().makeJSON()
    }
    /// When consumers call 'POST' on '/posts' with valid JSON
    /// construct and save
    func store(_ req: Request) throws -> ResponseRepresentable {
        let user = try req.user()
        try user.save()
        return user
    }
    // /GET to specific id users/1
    func show(_ req: Request, user: User) throws -> ResponseRepresentable {
        return user
    }
    
    // /DELETE by id users/1
    func delete(_ req: Request, user: User) throws -> ResponseRepresentable {
        try user.delete()
        return Response(status: .ok)
    }
    // /patch/update /UPDATE to specific users/id
    func update(_ req: Request, user: User) throws -> ResponseRepresentable {
        // See `extension User: Updateable`
        try user.update(for: req)
        
        // Save an return the updated user.
        try user.save()
        return user
    }
    
    // PUT to specifi users/id to change password
    func replace(_ req: Request, user: User) throws -> ResponseRepresentable {
        // First attempt to create a new User from the supplied JSON.
        // If any required fields are missing, this request will be denied.
        let new = try req.user()
        
        // Update the user with all of the properties from
        // the new user
        user.password = new.password
        try user.save()
        
        // Return the updated user
        return user
    }
    
    func makeResource() -> Resource<User> {
        return Resource(
            index: index,
            store: store,
            show: show,
            update: update,
            replace: replace,
            destroy: delete
        )
    }
}

extension Request {
    /// Create a user from the JSON body
    /// return BadRequest error if invalid
    /// or no JSON
    func user() throws -> User {
        guard let json = json else { throw Abort.badRequest }
        return try User(json: json)
    }
}

extension UserController: EmptyInitializable { }

import Vapor
import FluentProvider
import HTTP

final class User: Model {
    let storage = Storage()
    
    // MARK: Properties and database keys
    
    /// The content of the post
    var id: Node?
    var fn: String
    var ln: String
    var email: String
    var password: String //TODO: hash later
    var dob: String
    var locations: Siblings<User, Location, Order> {
        return siblings()
    }
    /// The column names for `id` and `content` in the database
    struct Keys {
        static let id = "id"
        static let fn = "first_name"
        static let ln = "last_name"
        static let email = "email"
        static let password = "password"
        static let dob = "dob"
    }
    
    /// Creates a new Post
    init(id: Node?, fn: String, ln: String, email: String, password: String, dob: String) {
        self.id = id
        self.fn = fn
        self.ln = ln
        self.email = email
        self.password = password
        self.dob = dob
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Post from the
    /// database row
    init(row: Row) throws {
        id = try row.get(User.Keys.id)
        fn = try row.get(User.Keys.fn)
        ln = try row.get(User.Keys.ln)
        email = try row.get(User.Keys.email)
        password = try row.get(User.Keys.password) //TODO: prob remove later...
        dob = try row.get(User.Keys.dob)
    }
    
    // Serializes the Post to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(User.Keys.fn, fn)
        try row.set(User.Keys.ln, ln)
        try row.set(User.Keys.email, email)
        try row.set(User.Keys.password, password)
        try row.set(User.Keys.dob, dob)
        return row
    }
}

// MARK: Fluent Preparation

extension User: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Posts
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string(User.Keys.fn)
            builder.string(User.Keys.ln)
            builder.string(User.Keys.email)
            builder.string(User.Keys.password)
            builder.string(User.Keys.dob)
        }
    }
    
    /// Undoes what was done in `prepare`
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

// MARK: JSON

// How the model converts from / to JSON.
// For example when:
//     - Creating a new Post (POST /posts)
//     - Fetching a post (GET /posts, GET /posts/:id)
//
extension User: JSONConvertible {
    convenience init(json: JSON) throws {
        self.init(
            id: try json.get(User.Keys.id),
            fn: try json.get(User.Keys.fn),
            ln: try json.get(User.Keys.ln),
            email: try json.get(User.Keys.email),
            password: try json.get(User.Keys.password),
            dob: try json.get(User.Keys.dob)
        )
    }

    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(User.Keys.id, id)
        try json.set(User.Keys.fn, fn)
        try json.set(User.Keys.ln, ln)
        try json.set(User.Keys.email, email)
        try json.set(User.Keys.password, password)
        try json.set(User.Keys.dob, dob)
        return json
    }
}

//needed
extension User: ResponseRepresentable { }



// This allows the Post model to be updated
// dynamically by the request.
extension User: Updateable {
    // Updateable keys are called when `post.update(for: req)` is called.
    // Add as many updateable keys as you like here.
    public static var updateableKeys: [UpdateableKey<User>] {
        return [
            // If the request contains a String at key "content"
            // the setter callback will be called.
            UpdateableKey(User.Keys.password, String.self) { user, password in
                user.password = password
            }
        ]
    }
}


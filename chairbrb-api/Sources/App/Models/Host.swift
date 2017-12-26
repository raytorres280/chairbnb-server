import Vapor
import FluentProvider
import HTTP

final class Host: Model {
    let storage = Storage()
    
    // MARK: Properties and database keys
    
    /// The content of the post
    var fn: String
    var ln: String
    var email: String
    var password: String //TODO: hash later
    var dob: String
    var accNum: String?
    
    /// The column names for `id` and `content` in the database
    struct Keys {
        static let id = "id"
        static let fn = "first_name"
        static let ln = "last_name"
        static let email = "email"
        static let password = "password"
        static let dob = "dob"
        static let accNum = "acc_num"
    }
    
    /// Creates a new Post
    init(fn: String, ln: String, email: String, password: String, dob: String, accNum: String?) {
        self.fn = fn
        self.ln = ln
        self.email = email
        self.password = password
        self.dob = dob
        self.accNum = accNum
    }
    
    // MARK: Fluent Serialization
    
    /// Initializes the Post from the
    /// database row
    init(row: Row) throws {
        fn = try row.get(Host.Keys.fn)
        ln = try row.get(Host.Keys.ln)
        email = try row.get(Host.Keys.email)
        password = try row.get(Host.Keys.password) //TODO: prob remove later...
        dob = try row.get(Host.Keys.dob)
        accNum = try row.get(Host.Keys.accNum)
    }
    
    // Serializes the Post to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Host.Keys.fn, fn)
        try row.set(Host.Keys.ln, ln)
        try row.set(Host.Keys.email, email)
        try row.set(Host.Keys.password, password)
        try row.set(Host.Keys.dob, dob)
        try row.set(Host.Keys.accNum, accNum)
        return row
    }
}

// MARK: Fluent Preparation

extension Host: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Posts
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string(Host.Keys.fn)
            builder.string(Host.Keys.ln)
            builder.string(Host.Keys.email)
            builder.string(Host.Keys.password)
            builder.string(Host.Keys.dob)
            builder.string(Host.Keys.accNum)
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
extension Host: JSONConvertible {
    convenience init(json: JSON) throws {
        self.init(
            fn: try json.get(Host.Keys.fn),
            ln: try json.get(Host.Keys.ln),
            email: try json.get(Host.Keys.email),
            password: try json.get(Host.Keys.password),
            dob: try json.get(Host.Keys.dob),
            accNum: try json.get(Host.Keys.accNum)
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Host.Keys.id, id)
        try json.set(Host.Keys.fn, fn)
        try json.set(Host.Keys.ln, ln)
        try json.set(Host.Keys.email, email)
        try json.set(Host.Keys.password, password)
        try json.set(Host.Keys.dob, dob)
        try json.set(Host.Keys.accNum, accNum)
        return json
    }
}

//needed
extension Host: ResponseRepresentable { }



// This allows the Post model to be updated
// dynamically by the request.
extension Host: Updateable {
    // Updateable keys are called when `post.update(for: req)` is called.
    // Add as many updateable keys as you like here.
    public static var updateableKeys: [UpdateableKey<Host>] {
        return [
            // If the request contains a String at key "content"
            // the setter callback will be called.
            UpdateableKey(Host.Keys.password, String.self) { host, password in
                host.password = password
            },
            UpdateableKey(Host.Keys.accNum, String.self) { host, accNum in
                host.accNum = accNum
            }
        ]
    }
}
//1:n host:locations
//extension Host {
//    var locations: Children<Host, Location> {
//        return children()
//    }
//}


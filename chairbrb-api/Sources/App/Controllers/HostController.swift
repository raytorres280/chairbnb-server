import Vapor
import HTTP

/// Here we have a controller that helps facilitate
/// RESTful interactions with our Hosts table
final class HostController: ResourceRepresentable {
    /// When users call 'GET' on '/hosts'
    /// it should return an index of all available hosts
    func index(_ req: Request) throws -> ResponseRepresentable {
        return try Host.all().makeJSON()
    }
    
    /// When consumers call 'POST' on '/hosts' with valid JSON
    /// construct and save the host
    func store(_ req: Request) throws -> ResponseRepresentable {
        let host = try req.host()
        try host.save()
        return host
    }
    
    /// When the consumer calls 'GET' on a specific resource, ie:
    /// '/hosts/13rd88' we should show that specific host
    func show(_ req: Request, host: Host) throws -> ResponseRepresentable {
        return host
    }
    
    /// When the consumer calls 'DELETE' on a specific resource, ie:
    /// 'hosts/l2jd9' we should remove that resource from the database
    func delete(_ req: Request, host: Host) throws -> ResponseRepresentable {
        try host.delete()
        return Response(status: .ok)
    }
    
    /// When the consumer calls 'DELETE' on the entire table, ie:
    /// '/hosts' we should remove the entire table
    func clear(_ req: Request) throws -> ResponseRepresentable {
        try Host.makeQuery().delete()
        return Response(status: .ok)
    }
    
    /// When the user calls 'PATCH' on a specific resource, we should
    /// update that resource to the new values.
    func update(_ req: Request, host: Host) throws -> ResponseRepresentable {
        // See `extension Host: Updateable`
        try host.update(for: req)
        
        // Save an return the updated host.
        try host.save()
        return host
    }
    
    /// When a user calls 'PUT' on a specific resource, we should replace any
    /// values that do not exist in the request with null.
    /// This is equivalent to creating a new host with the same ID.
    func replace(_ req: Request, host: Host) throws -> ResponseRepresentable {
        // First attempt to create a new Host from the supplied JSON.
        // If any required fields are missing, this request will be denied.
        let new = try req.host()
        
        // Update the host with all of the properties from
        // the new host
        host.id = new.id
        host.fn = new.fn
        host.ln = new.ln
        host.email = new.email
        host.password = new.password
        host.dob = new.dob
        host.accNum = new.accNum
        try host.save()
        
        // Return the updated host
        return host
    }
    
    /// When making a controller, it is pretty flexible in that it
    /// only expects closures, this is useful for advanced scenarios, but
    /// most of the time, it should look almost identical to this
    /// implementation
    func makeResource() -> Resource<Host> {
        return Resource(
            index: index,
            store: store,
            show: show,
            update: update,
            replace: replace,
            destroy: delete,
            clear: clear
        )
    }
}

extension Request {
    /// Create a host from the JSON body
    /// return BadRequest error if invalid
    /// or no JSON
    func host() throws -> Host {
        guard let json = json else { throw Abort.badRequest }
        return try Host(json: json)
    }
}

/// Since HostController doesn't require anything to
/// be initialized we can conform it to EmptyInitializable.
///
/// This will allow it to be passed by type.
extension HostController: EmptyInitializable { }


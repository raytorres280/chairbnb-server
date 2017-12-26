import Vapor
import HTTP

final class LocationController: ResourceRepresentable {
    
    func index(_ req: Request) throws -> ResponseRepresentable {
        return try Location.all().makeJSON()
    }
    
    func store(_ req: Request) throws -> ResponseRepresentable {
        let location = try req.location()
        try location.save()
        return location
    }
    
    func show(_ req: Request, location: Location) throws -> ResponseRepresentable {
        return location
    }
    
    func delete(_ req: Request, location: Location) throws -> ResponseRepresentable {
        try location.delete()
        return Response(status: .ok)
    }
    
    func makeResource() -> Resource<Location> {
        return Resource(
            index: index,
            store: store,
            show: show,
            destroy: delete
        )
    }
    
}

extension Request {
    func location() throws -> Location {
        guard let json = json else { throw Abort.badRequest }
        return try Location(json: json)
    }
}

extension LocationController: EmptyInitializable { }


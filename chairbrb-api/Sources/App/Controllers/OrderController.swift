import Vapor
import HTTP

final class OrderController: ResourceRepresentable {
    
    func index(_ req: Request) throws -> ResponseRepresentable {
        return try Order.all().makeJSON()
    }
    
    func store(_ req: Request) throws -> ResponseRepresentable {
        let order = try req.order()
        try order.save()
        return order
    }
    
    func show(_ req: Request, order: Order) throws -> ResponseRepresentable {
        return order
    }
    
    func delete(_ req: Request, order: Order) throws -> ResponseRepresentable {
        try order.delete()
        return Response(status: .ok)
    }
    
    func makeResource() -> Resource<Order> {
        return Resource(
            index: index,
            store: store,
            show: show,
            destroy: delete
        )
    }
}

extension Request {
    func order() throws -> Order {
        guard let json = json else { throw Abort.badRequest }
        return try Order(json: json)
    }
}

extension OrderController: EmptyInitializable { }

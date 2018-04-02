//  This file was automatically generated and should not be edited.

import Apollo

public final class LogsByUserIdQuery: GraphQLQuery {
  public static let operationString =
    "query LogsByUserId($id: ID!) {\n  logs: logsByUserId(id: $id) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("logsByUserId", alias: "logs", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.list(.nonNull(.object(Log.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(logs: [Log]) {
      self.init(snapshot: ["__typename": "Query", "logs": logs.map { (value: Log) -> Snapshot in value.snapshot }])
    }

    public var logs: [Log] {
      get {
        return (snapshot["logs"] as! [Snapshot]).map { (value: Snapshot) -> Log in Log(snapshot: value) }
      }
      set {
        snapshot.updateValue(newValue.map { (value: Log) -> Snapshot in value.snapshot }, forKey: "logs")
      }
    }

    public struct Log: GraphQLSelectionSet {
      public static let possibleTypes = ["Log"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID) {
        self.init(snapshot: ["__typename": "Log", "id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class MealsQuery: GraphQLQuery {
  public static let operationString =
    "query Meals {\n  meals {\n    __typename\n    id\n    name\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("meals", type: .nonNull(.list(.nonNull(.object(Meal.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(meals: [Meal]) {
      self.init(snapshot: ["__typename": "Query", "meals": meals.map { (value: Meal) -> Snapshot in value.snapshot }])
    }

    public var meals: [Meal] {
      get {
        return (snapshot["meals"] as! [Snapshot]).map { (value: Snapshot) -> Meal in Meal(snapshot: value) }
      }
      set {
        snapshot.updateValue(newValue.map { (value: Meal) -> Snapshot in value.snapshot }, forKey: "meals")
      }
    }

    public struct Meal: GraphQLSelectionSet {
      public static let possibleTypes = ["Meal"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String) {
        self.init(snapshot: ["__typename": "Meal", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}
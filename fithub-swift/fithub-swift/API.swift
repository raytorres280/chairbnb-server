//  This file was automatically generated and should not be edited.

import Apollo

public final class LogsByUserIdQuery: GraphQLQuery {
  public static let operationString =
    "query LogsByUserId($id: ID!) {\n  logs: logsByUserId(id: $id) {\n    __typename\n    id\n    createdAt\n    meals {\n      __typename\n      id\n      name\n      calories\n      proteins\n      carbs\n      fats\n    }\n    totalWater\n  }\n}"

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
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("meals", type: .list(.nonNull(.object(Meal.selections)))),
        GraphQLField("totalWater", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, createdAt: String, meals: [Meal]? = nil, totalWater: Int? = nil) {
        self.init(snapshot: ["__typename": "Log", "id": id, "createdAt": createdAt, "meals": meals.flatMap { (value: [Meal]) -> [Snapshot] in value.map { (value: Meal) -> Snapshot in value.snapshot } }, "totalWater": totalWater])
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

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var meals: [Meal]? {
        get {
          return (snapshot["meals"] as? [Snapshot]).flatMap { (value: [Snapshot]) -> [Meal] in value.map { (value: Snapshot) -> Meal in Meal(snapshot: value) } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [Meal]) -> [Snapshot] in value.map { (value: Meal) -> Snapshot in value.snapshot } }, forKey: "meals")
        }
      }

      public var totalWater: Int? {
        get {
          return snapshot["totalWater"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "totalWater")
        }
      }

      public struct Meal: GraphQLSelectionSet {
        public static let possibleTypes = ["Meal"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("calories", type: .nonNull(.scalar(Int.self))),
          GraphQLField("proteins", type: .nonNull(.scalar(Int.self))),
          GraphQLField("carbs", type: .nonNull(.scalar(Int.self))),
          GraphQLField("fats", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, calories: Int, proteins: Int, carbs: Int, fats: Int) {
          self.init(snapshot: ["__typename": "Meal", "id": id, "name": name, "calories": calories, "proteins": proteins, "carbs": carbs, "fats": fats])
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

        public var calories: Int {
          get {
            return snapshot["calories"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "calories")
          }
        }

        public var proteins: Int {
          get {
            return snapshot["proteins"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "proteins")
          }
        }

        public var carbs: Int {
          get {
            return snapshot["carbs"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "carbs")
          }
        }

        public var fats: Int {
          get {
            return snapshot["fats"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "fats")
          }
        }
      }
    }
  }
}

public final class MealsQuery: GraphQLQuery {
  public static let operationString =
    "query Meals {\n  meals {\n    __typename\n    id\n    name\n    calories\n    proteins\n    carbs\n    fats\n  }\n}"

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
        GraphQLField("calories", type: .nonNull(.scalar(Int.self))),
        GraphQLField("proteins", type: .nonNull(.scalar(Int.self))),
        GraphQLField("carbs", type: .nonNull(.scalar(Int.self))),
        GraphQLField("fats", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, calories: Int, proteins: Int, carbs: Int, fats: Int) {
        self.init(snapshot: ["__typename": "Meal", "id": id, "name": name, "calories": calories, "proteins": proteins, "carbs": carbs, "fats": fats])
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

      public var calories: Int {
        get {
          return snapshot["calories"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "calories")
        }
      }

      public var proteins: Int {
        get {
          return snapshot["proteins"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "proteins")
        }
      }

      public var carbs: Int {
        get {
          return snapshot["carbs"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "carbs")
        }
      }

      public var fats: Int {
        get {
          return snapshot["fats"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "fats")
        }
      }
    }
  }
}
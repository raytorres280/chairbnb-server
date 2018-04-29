//  This file was automatically generated and should not be edited.

import Apollo

public enum MEALTYPE: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case breakfast
  case lunch
  case dinner
  case snack
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "BREAKFAST": self = .breakfast
      case "LUNCH": self = .lunch
      case "DINNER": self = .dinner
      case "SNACK": self = .snack
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .breakfast: return "BREAKFAST"
      case .lunch: return "LUNCH"
      case .dinner: return "DINNER"
      case .snack: return "SNACK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MEALTYPE, rhs: MEALTYPE) -> Bool {
    switch (lhs, rhs) {
      case (.breakfast, .breakfast): return true
      case (.lunch, .lunch): return true
      case (.dinner, .dinner): return true
      case (.snack, .snack): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  public static let operationString =
    "mutation Login($email: String!, $password: String!) {\n  login(email: $email, password: $password) {\n    __typename\n    user {\n      __typename\n      id\n    }\n  }\n}"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .nonNull(.object(Login.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(login: Login) {
      self.init(snapshot: ["__typename": "Mutation", "login": login.snapshot])
    }

    public var login: Login {
      get {
        return Login(snapshot: snapshot["login"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(user: User) {
        self.init(snapshot: ["__typename": "AuthPayload", "user": user.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["user"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID) {
          self.init(snapshot: ["__typename": "User", "id": id])
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
}

public final class SignupMutation: GraphQLMutation {
  public static let operationString =
    "mutation Signup($email: String!, $password: String!, $name: String!) {\n  signup(email: $email, password: $password, name: $name) {\n    __typename\n    user {\n      __typename\n      id\n    }\n  }\n}"

  public var email: String
  public var password: String
  public var name: String

  public init(email: String, password: String, name: String) {
    self.email = email
    self.password = password
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password, "name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("signup", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password"), "name": GraphQLVariable("name")], type: .nonNull(.object(Signup.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(signup: Signup) {
      self.init(snapshot: ["__typename": "Mutation", "signup": signup.snapshot])
    }

    public var signup: Signup {
      get {
        return Signup(snapshot: snapshot["signup"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "signup")
      }
    }

    public struct Signup: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(user: User) {
        self.init(snapshot: ["__typename": "AuthPayload", "user": user.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["user"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID) {
          self.init(snapshot: ["__typename": "User", "id": id])
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
}

public final class LogsByUserIdQuery: GraphQLQuery {
  public static let operationString =
    "query LogsByUserId($id: ID!) {\n  logs: logsByUserId(id: $id) {\n    __typename\n    ...LogDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(LogDetails.fragmentString).appending(MealLogEntryDetails.fragmentString).appending(MealDetails.fragmentString) }

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
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("meals", type: .list(.nonNull(.object(Meal.selections)))),
        GraphQLField("totalWater", type: .scalar(Int.self)),
        GraphQLField("caloriesBurned", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, createdAt: String, meals: [Meal]? = nil, totalWater: Int? = nil, caloriesBurned: Int? = nil) {
        self.init(snapshot: ["__typename": "Log", "id": id, "createdAt": createdAt, "meals": meals.flatMap { (value: [Meal]) -> [Snapshot] in value.map { (value: Meal) -> Snapshot in value.snapshot } }, "totalWater": totalWater, "caloriesBurned": caloriesBurned])
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

      public var caloriesBurned: Int? {
        get {
          return snapshot["caloriesBurned"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "caloriesBurned")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var logDetails: LogDetails {
          get {
            return LogDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Meal: GraphQLSelectionSet {
        public static let possibleTypes = ["MealLogEntry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("meal", type: .nonNull(.object(Meal.selections))),
          GraphQLField("mealType", type: .scalar(MEALTYPE.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, meal: Meal, mealType: MEALTYPE? = nil) {
          self.init(snapshot: ["__typename": "MealLogEntry", "id": id, "meal": meal.snapshot, "mealType": mealType])
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

        public var meal: Meal {
          get {
            return Meal(snapshot: snapshot["meal"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "meal")
          }
        }

        public var mealType: MEALTYPE? {
          get {
            return snapshot["mealType"] as? MEALTYPE
          }
          set {
            snapshot.updateValue(newValue, forKey: "mealType")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var mealLogEntryDetails: MealLogEntryDetails {
            get {
              return MealLogEntryDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Meal: GraphQLSelectionSet {
          public static let possibleTypes = ["Meal"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var mealDetails: MealDetails {
              get {
                return MealDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class CreateLogMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateLog($userId: ID!) {\n  log: createLog(userId: $userId) {\n    __typename\n    ...LogDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(LogDetails.fragmentString).appending(MealLogEntryDetails.fragmentString).appending(MealDetails.fragmentString) }

  public var userId: GraphQLID

  public init(userId: GraphQLID) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createLog", alias: "log", arguments: ["userId": GraphQLVariable("userId")], type: .nonNull(.object(Log.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(log: Log) {
      self.init(snapshot: ["__typename": "Mutation", "log": log.snapshot])
    }

    public var log: Log {
      get {
        return Log(snapshot: snapshot["log"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "log")
      }
    }

    public struct Log: GraphQLSelectionSet {
      public static let possibleTypes = ["Log"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("meals", type: .list(.nonNull(.object(Meal.selections)))),
        GraphQLField("totalWater", type: .scalar(Int.self)),
        GraphQLField("caloriesBurned", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, createdAt: String, meals: [Meal]? = nil, totalWater: Int? = nil, caloriesBurned: Int? = nil) {
        self.init(snapshot: ["__typename": "Log", "id": id, "createdAt": createdAt, "meals": meals.flatMap { (value: [Meal]) -> [Snapshot] in value.map { (value: Meal) -> Snapshot in value.snapshot } }, "totalWater": totalWater, "caloriesBurned": caloriesBurned])
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

      public var caloriesBurned: Int? {
        get {
          return snapshot["caloriesBurned"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "caloriesBurned")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var logDetails: LogDetails {
          get {
            return LogDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Meal: GraphQLSelectionSet {
        public static let possibleTypes = ["MealLogEntry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("meal", type: .nonNull(.object(Meal.selections))),
          GraphQLField("mealType", type: .scalar(MEALTYPE.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, meal: Meal, mealType: MEALTYPE? = nil) {
          self.init(snapshot: ["__typename": "MealLogEntry", "id": id, "meal": meal.snapshot, "mealType": mealType])
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

        public var meal: Meal {
          get {
            return Meal(snapshot: snapshot["meal"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "meal")
          }
        }

        public var mealType: MEALTYPE? {
          get {
            return snapshot["mealType"] as? MEALTYPE
          }
          set {
            snapshot.updateValue(newValue, forKey: "mealType")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var mealLogEntryDetails: MealLogEntryDetails {
            get {
              return MealLogEntryDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Meal: GraphQLSelectionSet {
          public static let possibleTypes = ["Meal"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var mealDetails: MealDetails {
              get {
                return MealDetails(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public final class MealsQuery: GraphQLQuery {
  public static let operationString =
    "query Meals {\n  meals {\n    __typename\n    ...MealDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(MealDetails.fragmentString) }

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

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var mealDetails: MealDetails {
          get {
            return MealDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class AddMealEntryToLogMutation: GraphQLMutation {
  public static let operationString =
    "mutation addMealEntryToLog($id: ID!, $mealId: ID!, $mealType: MEALTYPE) {\n  addMealEntryToLog(id: $id, mealId: $mealId, mealType: $mealType) {\n    __typename\n    ...MealLogEntryDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(MealLogEntryDetails.fragmentString).appending(MealDetails.fragmentString) }

  public var id: GraphQLID
  public var mealId: GraphQLID
  public var mealType: MEALTYPE?

  public init(id: GraphQLID, mealId: GraphQLID, mealType: MEALTYPE? = nil) {
    self.id = id
    self.mealId = mealId
    self.mealType = mealType
  }

  public var variables: GraphQLMap? {
    return ["id": id, "mealId": mealId, "mealType": mealType]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addMealEntryToLog", arguments: ["id": GraphQLVariable("id"), "mealId": GraphQLVariable("mealId"), "mealType": GraphQLVariable("mealType")], type: .nonNull(.object(AddMealEntryToLog.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(addMealEntryToLog: AddMealEntryToLog) {
      self.init(snapshot: ["__typename": "Mutation", "addMealEntryToLog": addMealEntryToLog.snapshot])
    }

    public var addMealEntryToLog: AddMealEntryToLog {
      get {
        return AddMealEntryToLog(snapshot: snapshot["addMealEntryToLog"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "addMealEntryToLog")
      }
    }

    public struct AddMealEntryToLog: GraphQLSelectionSet {
      public static let possibleTypes = ["MealLogEntry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("meal", type: .nonNull(.object(Meal.selections))),
        GraphQLField("mealType", type: .scalar(MEALTYPE.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, meal: Meal, mealType: MEALTYPE? = nil) {
        self.init(snapshot: ["__typename": "MealLogEntry", "id": id, "meal": meal.snapshot, "mealType": mealType])
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

      public var meal: Meal {
        get {
          return Meal(snapshot: snapshot["meal"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "meal")
        }
      }

      public var mealType: MEALTYPE? {
        get {
          return snapshot["mealType"] as? MEALTYPE
        }
        set {
          snapshot.updateValue(newValue, forKey: "mealType")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var mealLogEntryDetails: MealLogEntryDetails {
          get {
            return MealLogEntryDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Meal: GraphQLSelectionSet {
        public static let possibleTypes = ["Meal"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var mealDetails: MealDetails {
            get {
              return MealDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class RemoveMealEntryFromLogMutation: GraphQLMutation {
  public static let operationString =
    "mutation removeMealEntryFromLog($id: ID!) {\n  removeMealEntryFromLog(id: $id) {\n    __typename\n    ...MealLogEntryDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(MealLogEntryDetails.fragmentString).appending(MealDetails.fragmentString) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("removeMealEntryFromLog", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(RemoveMealEntryFromLog.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(removeMealEntryFromLog: RemoveMealEntryFromLog) {
      self.init(snapshot: ["__typename": "Mutation", "removeMealEntryFromLog": removeMealEntryFromLog.snapshot])
    }

    public var removeMealEntryFromLog: RemoveMealEntryFromLog {
      get {
        return RemoveMealEntryFromLog(snapshot: snapshot["removeMealEntryFromLog"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "removeMealEntryFromLog")
      }
    }

    public struct RemoveMealEntryFromLog: GraphQLSelectionSet {
      public static let possibleTypes = ["MealLogEntry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("meal", type: .nonNull(.object(Meal.selections))),
        GraphQLField("mealType", type: .scalar(MEALTYPE.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, meal: Meal, mealType: MEALTYPE? = nil) {
        self.init(snapshot: ["__typename": "MealLogEntry", "id": id, "meal": meal.snapshot, "mealType": mealType])
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

      public var meal: Meal {
        get {
          return Meal(snapshot: snapshot["meal"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "meal")
        }
      }

      public var mealType: MEALTYPE? {
        get {
          return snapshot["mealType"] as? MEALTYPE
        }
        set {
          snapshot.updateValue(newValue, forKey: "mealType")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var mealLogEntryDetails: MealLogEntryDetails {
          get {
            return MealLogEntryDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Meal: GraphQLSelectionSet {
        public static let possibleTypes = ["Meal"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var mealDetails: MealDetails {
            get {
              return MealDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public struct LogDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment LogDetails on Log {\n  __typename\n  id\n  createdAt\n  meals {\n    __typename\n    ...MealLogEntryDetails\n  }\n  totalWater\n  caloriesBurned\n}"

  public static let possibleTypes = ["Log"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
    GraphQLField("meals", type: .list(.nonNull(.object(Meal.selections)))),
    GraphQLField("totalWater", type: .scalar(Int.self)),
    GraphQLField("caloriesBurned", type: .scalar(Int.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, createdAt: String, meals: [Meal]? = nil, totalWater: Int? = nil, caloriesBurned: Int? = nil) {
    self.init(snapshot: ["__typename": "Log", "id": id, "createdAt": createdAt, "meals": meals.flatMap { (value: [Meal]) -> [Snapshot] in value.map { (value: Meal) -> Snapshot in value.snapshot } }, "totalWater": totalWater, "caloriesBurned": caloriesBurned])
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

  public var caloriesBurned: Int? {
    get {
      return snapshot["caloriesBurned"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "caloriesBurned")
    }
  }

  public struct Meal: GraphQLSelectionSet {
    public static let possibleTypes = ["MealLogEntry"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("meal", type: .nonNull(.object(Meal.selections))),
      GraphQLField("mealType", type: .scalar(MEALTYPE.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID, meal: Meal, mealType: MEALTYPE? = nil) {
      self.init(snapshot: ["__typename": "MealLogEntry", "id": id, "meal": meal.snapshot, "mealType": mealType])
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

    public var meal: Meal {
      get {
        return Meal(snapshot: snapshot["meal"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "meal")
      }
    }

    public var mealType: MEALTYPE? {
      get {
        return snapshot["mealType"] as? MEALTYPE
      }
      set {
        snapshot.updateValue(newValue, forKey: "mealType")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var mealLogEntryDetails: MealLogEntryDetails {
        get {
          return MealLogEntryDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Meal: GraphQLSelectionSet {
      public static let possibleTypes = ["Meal"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var mealDetails: MealDetails {
          get {
            return MealDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct MealLogEntryDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment MealLogEntryDetails on MealLogEntry {\n  __typename\n  id\n  meal {\n    __typename\n    ...MealDetails\n  }\n  mealType\n}"

  public static let possibleTypes = ["MealLogEntry"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("meal", type: .nonNull(.object(Meal.selections))),
    GraphQLField("mealType", type: .scalar(MEALTYPE.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, meal: Meal, mealType: MEALTYPE? = nil) {
    self.init(snapshot: ["__typename": "MealLogEntry", "id": id, "meal": meal.snapshot, "mealType": mealType])
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

  public var meal: Meal {
    get {
      return Meal(snapshot: snapshot["meal"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "meal")
    }
  }

  public var mealType: MEALTYPE? {
    get {
      return snapshot["mealType"] as? MEALTYPE
    }
    set {
      snapshot.updateValue(newValue, forKey: "mealType")
    }
  }

  public struct Meal: GraphQLSelectionSet {
    public static let possibleTypes = ["Meal"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
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

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var mealDetails: MealDetails {
        get {
          return MealDetails(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

public struct MealDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment MealDetails on Meal {\n  __typename\n  id\n  name\n  calories\n  proteins\n  carbs\n  fats\n}"

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
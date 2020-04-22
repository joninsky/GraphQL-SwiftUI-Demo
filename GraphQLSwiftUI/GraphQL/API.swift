// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class BusinessesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Businesses($searchTerm: String, $latitude: Float, $longitude: Float) {
      search(term: $searchTerm, latitude: $latitude, longitude: $longitude) {
        __typename
        business {
          __typename
          ...BusinessFragment
        }
      }
    }
    """

  public let operationName: String = "Businesses"

  public let operationIdentifier: String? = "3d4c4624f603751075df852991d54d2bc642427f6e777128c813c923a9e248ed"

  public var queryDocument: String { return operationDefinition.appending(BusinessFragment.fragmentDefinition) }

  public var searchTerm: String?
  public var latitude: Double?
  public var longitude: Double?

  public init(searchTerm: String? = nil, latitude: Double? = nil, longitude: Double? = nil) {
    self.searchTerm = searchTerm
    self.latitude = latitude
    self.longitude = longitude
  }

  public var variables: GraphQLMap? {
    return ["searchTerm": searchTerm, "latitude": latitude, "longitude": longitude]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["term": GraphQLVariable("searchTerm"), "latitude": GraphQLVariable("latitude"), "longitude": GraphQLVariable("longitude")], type: .object(Search.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.flatMap { (value: Search) -> ResultMap in value.resultMap }])
    }

    /// Search for businesses on Yelp.
    public var search: Search? {
      get {
        return (resultMap["search"] as? ResultMap).flatMap { Search(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Businesses"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("business", type: .list(.object(Business.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(business: [Business?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Businesses", "business": business.flatMap { (value: [Business?]) -> [ResultMap?] in value.map { (value: Business?) -> ResultMap? in value.flatMap { (value: Business) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of business Yelp finds based on the search criteria.
      public var business: [Business?]? {
        get {
          return (resultMap["business"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Business?] in value.map { (value: ResultMap?) -> Business? in value.flatMap { (value: ResultMap) -> Business in Business(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Business?]) -> [ResultMap?] in value.map { (value: Business?) -> ResultMap? in value.flatMap { (value: Business) -> ResultMap in value.resultMap } } }, forKey: "business")
        }
      }

      public struct Business: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Business"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("url", type: .scalar(String.self)),
          GraphQLField("rating", type: .scalar(Double.self)),
          GraphQLField("photos", type: .list(.scalar(String.self))),
          GraphQLField("distance", type: .scalar(Double.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, name: String? = nil, url: String? = nil, rating: Double? = nil, photos: [String?]? = nil, distance: Double? = nil) {
          self.init(unsafeResultMap: ["__typename": "Business", "id": id, "name": name, "url": url, "rating": rating, "photos": photos, "distance": distance])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Yelp ID of this business.
        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// Name of this business.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// URL for business page on Yelp.
        public var url: String? {
          get {
            return resultMap["url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        /// Rating for this business (value ranges from 1, 1.5, ... 4.5, 5).
        public var rating: Double? {
          get {
            return resultMap["rating"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
          }
        }

        /// URLs of up to three photos of the business.
        public var photos: [String?]? {
          get {
            return resultMap["photos"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "photos")
          }
        }

        /// When searching, this provides the distance of the business from the search location in meters
        public var distance: Double? {
          get {
            return resultMap["distance"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "distance")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var businessFragment: BusinessFragment {
            get {
              return BusinessFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct BusinessFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment BusinessFragment on Business {
      __typename
      id
      name
      url
      rating
      photos
      distance
    }
    """

  public static let possibleTypes: [String] = ["Business"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .scalar(String.self)),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("url", type: .scalar(String.self)),
    GraphQLField("rating", type: .scalar(Double.self)),
    GraphQLField("photos", type: .list(.scalar(String.self))),
    GraphQLField("distance", type: .scalar(Double.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String? = nil, name: String? = nil, url: String? = nil, rating: Double? = nil, photos: [String?]? = nil, distance: Double? = nil) {
    self.init(unsafeResultMap: ["__typename": "Business", "id": id, "name": name, "url": url, "rating": rating, "photos": photos, "distance": distance])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Yelp ID of this business.
  public var id: String? {
    get {
      return resultMap["id"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// Name of this business.
  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// URL for business page on Yelp.
  public var url: String? {
    get {
      return resultMap["url"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  /// Rating for this business (value ranges from 1, 1.5, ... 4.5, 5).
  public var rating: Double? {
    get {
      return resultMap["rating"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "rating")
    }
  }

  /// URLs of up to three photos of the business.
  public var photos: [String?]? {
    get {
      return resultMap["photos"] as? [String?]
    }
    set {
      resultMap.updateValue(newValue, forKey: "photos")
    }
  }

  /// When searching, this provides the distance of the business from the search location in meters
  public var distance: Double? {
    get {
      return resultMap["distance"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "distance")
    }
  }
}

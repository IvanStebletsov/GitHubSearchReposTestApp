//  This file was automatically generated and should not be edited.

import Apollo

public final class FetchReposForSeachQuery: GraphQLQuery {
  public let operationDefinition =
    "query FetchReposForSeach($text: String!, $after: String) {\n  allRepos: search(query: $text, type: REPOSITORY, first: 30, after: $after) {\n    __typename\n    totalCount: repositoryCount\n    page: pageInfo {\n      __typename\n      hasNext: hasNextPage\n      endId: endCursor\n    }\n    fetchedRepos: edges {\n      __typename\n      repoInfo: node {\n        __typename\n        ... on Repository {\n          ...RepoDetails\n        }\n      }\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(RepoDetails.fragmentDefinition) }

  public var text: String
  public var after: String?

  public init(text: String, after: String? = nil) {
    self.text = text
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["text": text, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", alias: "allRepos", arguments: ["query": GraphQLVariable("text"), "type": "REPOSITORY", "first": 30, "after": GraphQLVariable("after")], type: .nonNull(.object(AllRepo.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allRepos: AllRepo) {
      self.init(unsafeResultMap: ["__typename": "Query", "allRepos": allRepos.resultMap])
    }

    /// Perform a search across resources.
    public var allRepos: AllRepo {
      get {
        return AllRepo(unsafeResultMap: resultMap["allRepos"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "allRepos")
      }
    }

    public struct AllRepo: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchResultItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("repositoryCount", alias: "totalCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("pageInfo", alias: "page", type: .nonNull(.object(Page.selections))),
        GraphQLField("edges", alias: "fetchedRepos", type: .list(.object(FetchedRepo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int, page: Page, fetchedRepos: [FetchedRepo?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "totalCount": totalCount, "page": page.resultMap, "fetchedRepos": fetchedRepos.flatMap { (value: [FetchedRepo?]) -> [ResultMap?] in value.map { (value: FetchedRepo?) -> ResultMap? in value.flatMap { (value: FetchedRepo) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The number of repositories that matched the search query.
      public var totalCount: Int {
        get {
          return resultMap["totalCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      /// Information to aid in pagination.
      public var page: Page {
        get {
          return Page(unsafeResultMap: resultMap["page"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "page")
        }
      }

      /// A list of edges.
      public var fetchedRepos: [FetchedRepo?]? {
        get {
          return (resultMap["fetchedRepos"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FetchedRepo?] in value.map { (value: ResultMap?) -> FetchedRepo? in value.flatMap { (value: ResultMap) -> FetchedRepo in FetchedRepo(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [FetchedRepo?]) -> [ResultMap?] in value.map { (value: FetchedRepo?) -> ResultMap? in value.flatMap { (value: FetchedRepo) -> ResultMap in value.resultMap } } }, forKey: "fetchedRepos")
        }
      }

      public struct Page: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hasNextPage", alias: "hasNext", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("endCursor", alias: "endId", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNext: Bool, endId: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNext": hasNext, "endId": endId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNext: Bool {
          get {
            return resultMap["hasNext"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNext")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endId: String? {
          get {
            return resultMap["endId"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endId")
          }
        }
      }

      public struct FetchedRepo: GraphQLSelectionSet {
        public static let possibleTypes = ["SearchResultItemEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", alias: "repoInfo", type: .object(RepoInfo.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(repoInfo: RepoInfo? = nil) {
          self.init(unsafeResultMap: ["__typename": "SearchResultItemEdge", "repoInfo": repoInfo.flatMap { (value: RepoInfo) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var repoInfo: RepoInfo? {
          get {
            return (resultMap["repoInfo"] as? ResultMap).flatMap { RepoInfo(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "repoInfo")
          }
        }

        public struct RepoInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["Issue", "PullRequest", "Repository", "User", "Organization", "MarketplaceListing"]

          public static let selections: [GraphQLSelection] = [
            GraphQLTypeCase(
              variants: ["Repository": AsRepository.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeIssue() -> RepoInfo {
            return RepoInfo(unsafeResultMap: ["__typename": "Issue"])
          }

          public static func makePullRequest() -> RepoInfo {
            return RepoInfo(unsafeResultMap: ["__typename": "PullRequest"])
          }

          public static func makeUser() -> RepoInfo {
            return RepoInfo(unsafeResultMap: ["__typename": "User"])
          }

          public static func makeOrganization() -> RepoInfo {
            return RepoInfo(unsafeResultMap: ["__typename": "Organization"])
          }

          public static func makeMarketplaceListing() -> RepoInfo {
            return RepoInfo(unsafeResultMap: ["__typename": "MarketplaceListing"])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asRepository: AsRepository? {
            get {
              if !AsRepository.possibleTypes.contains(__typename) { return nil }
              return AsRepository(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsRepository: GraphQLSelectionSet {
            public static let possibleTypes = ["Repository"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RepoDetails.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

              public var repoDetails: RepoDetails {
                get {
                  return RepoDetails(unsafeResultMap: resultMap)
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
  }
}

public struct RepoDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment RepoDetails on Repository {\n  __typename\n  id\n  name: nameWithOwner\n  description\n  url\n  starRating: stargazers {\n    __typename\n    totalCount\n  }\n  language: primaryLanguage {\n    __typename\n    name\n    color\n  }\n}"

  public static let possibleTypes = ["Repository"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("nameWithOwner", alias: "name", type: .nonNull(.scalar(String.self))),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("url", type: .nonNull(.scalar(String.self))),
    GraphQLField("stargazers", alias: "starRating", type: .nonNull(.object(StarRating.selections))),
    GraphQLField("primaryLanguage", alias: "language", type: .object(Language.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, description: String? = nil, url: String, starRating: StarRating, language: Language? = nil) {
    self.init(unsafeResultMap: ["__typename": "Repository", "id": id, "name": name, "description": description, "url": url, "starRating": starRating.resultMap, "language": language.flatMap { (value: Language) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The repository's name with owner.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The description of the repository.
  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  /// The HTTP URL for this repository
  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  /// A list of users who have starred this starrable.
  public var starRating: StarRating {
    get {
      return StarRating(unsafeResultMap: resultMap["starRating"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "starRating")
    }
  }

  /// The primary language of the repository's code.
  public var language: Language? {
    get {
      return (resultMap["language"] as? ResultMap).flatMap { Language(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "language")
    }
  }

  public struct StarRating: GraphQLSelectionSet {
    public static let possibleTypes = ["StargazerConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }

  public struct Language: GraphQLSelectionSet {
    public static let possibleTypes = ["Language"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("color", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, color: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Language", "name": name, "color": color])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The name of the current language.
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    /// The color defined for the current language.
    public var color: String? {
      get {
        return resultMap["color"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "color")
      }
    }
  }
}
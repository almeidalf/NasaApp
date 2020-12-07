//
//  Service.swift
//  NasaApp
//
//  Created by Felipe Almeida on 05/12/20.
//

import Foundation
import Moya

fileprivate struct ServiceAPIConfig {
    fileprivate static let keys = Keys()
    static let API_KEY = keys.NASA_API
}

enum Service {
    case apod
}


extension Service: TargetType {
  // 1
  public var baseURL: URL {
    let urlString = "https://api.nasa.gov"
    let apiPath = "?api_key=\(ServiceAPIConfig.API_KEY)"
    switch self {
    case .apod:
        return URL(string: urlString + apiPath)!
    default:
        return URL(string: urlString)!
    }
  }

  // 2
  public var path: String {
    switch self {
    case .apod: return "/planetary/apod"
    }
  }
    
//    var parameterEncoding: Moya.ParameterEncoding {
//            switch self {
//                case .apod:
//                    //return MyURLEncoding.queryString
//                    return URLEncoding.queryString
//                default:
//                    return JSONEncoding.default
//            }
//        }

  // 3
  public var method: Moya.Method {
    switch self {
    case .apod: return .get
    }
  }

  // 4
  public var sampleData: Data {
    return Data()
  }

  // 5
  public var task: Task {
    switch self {
    case .apod:
        return .requestParameters(parameters: [:] , encoding: URLEncoding.default)
    }
  }

  // 6
  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }

  // 7
  public var validationType: ValidationType {
    return .none
  }
}

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
    case asteroids(RequestAsteroids)
}


extension Service: TargetType {

  public var baseURL: URL {
    let urlString = "https://api.nasa.gov"
    
    switch self {
    case .apod:
        return URL(string: urlString + "?api_key=\(ServiceAPIConfig.API_KEY)")!
    case let .asteroids(datas):
        return URL(string: urlString + "&api_key=\(ServiceAPIConfig.API_KEY)")!
    default:
        return URL(string: urlString)!
    }
  }


  public var path: String {
    switch self {
    case .apod:
        return "/planetary/apod"
    case let .asteroids(datas):
        return "/neo/rest/v1/feed?start_date=\(datas.dataInicial)&end_date=\(datas.dataFinal)"
    }
  }

  public var method: Moya.Method {
    switch self {
    case .apod: return .get
    case let .asteroids(datas): return .get
    }
  }

  public var sampleData: Data {
    return Data()
  }

  public var task: Task {
    switch self {
    case .apod:
        return .requestParameters(parameters: [:] , encoding: URLEncoding.default)
    case let .asteroids(datas):
        return .requestPlain
    }
  }

  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }

  public var validationType: ValidationType {
    return .none
  }
}

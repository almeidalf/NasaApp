//
//  ApodResponse.swift
//  NasaApp
//
//  Created by Felipe Almeida on 05/12/20.
//

import Foundation

// MARK: - ApodResponse
struct ApodResponse: Decodable {
    let copyright: String?
    let date, explanation: String
    let hdurl: String
    let mediaType, serviceVersion, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case copyright
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}

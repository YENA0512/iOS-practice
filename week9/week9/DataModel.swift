//
//  ViewController.swift
//  week9
//
//  Created by 이예나 on 11/23/22.
//

import Foundation

// MARK: - DataModel
struct DataModel: Codable {
    let response: Response
}

struct Response: Codable {
    let header: Header
    let body: Body
}

struct Body: Codable {
    let items: Items
    let numOfRows, pageNo, totalCount: Int
}

struct Items: Codable {
    let item: [Item]
}

struct Item: Codable {
    let subwayRouteName, subwayStationID, subwayStationName: String

    enum CodingKeys: String, CodingKey {
        case subwayRouteName
        case subwayStationID = "subwayStationId"
        case subwayStationName
    }
}

struct Header: Codable {
    let resultCode, resultMsg: String
}

//
//  SportsModel.swift
//  Kaizen
//
//  Created by Bill on 9/2/24.
//

import Foundation

struct SportsModel: Decodable {
    let i: String? //id
    let d: String? //name
    let e: [EventsModel]? //events
}

struct EventsModel: Decodable {
    let d: String? //name
    let i: String? //id
    let si: String? //sport id
    let sh: String? // ??
    let tt: Int? // event start time
}

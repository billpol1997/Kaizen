//
//  SportsList.swift
//  Kaizen
//
//  Created by Bill on 9/2/24.
//

import Foundation

struct SportsList {
    let list: [Sport]?
    
    init(list: [SportsModel]?) {
        self.list = list.map({ sports in
            sports.map { item in
                Sport(sport: item)
            }
        })
    }
}

struct Sport {
    let id: String?
    let name: String?
    let events: [Event]?
    
    init(sport: SportsModel?) {
        self.id = sport?.i
        self.name = sport?.d
        self.events = sport?.e.map({ events in
            events.map { item in
                Event(event: item)
            }
        })
    }
}

struct Event {
    let id: String?
    let name: String?
    let sportId: String?
    let startTime: Int?
    var dataFactory = DataFactory.shared
    
    init(event: EventsModel?) {
        self.id = event?.i
        self.name = dataFactory.transformMatchTitle(with: event?.d ?? "")
        self.sportId = event?.si
        self.startTime = event?.tt
    }
}

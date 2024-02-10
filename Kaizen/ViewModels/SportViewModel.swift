//
//  SportViewModel.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation
import SwiftUI

enum SportsEnum: String {
    case soccer = "SOCCER"
    case basketball = "BASKETBALL"
    case tennis = "TENNIS"
    case none
}

final class SportViewModel: ObservableObject {
    
    @Published var sport: Sport
    @Published var events: [Event]
    private var type: SportsEnum
    private var dataFactory = DataFactory.shared
    
    init(sport: Sport) {
        self.sport = sport
        self.type = SportsEnum(rawValue: sport.name ?? "") ?? .none
        self.events = sport.events ?? []
    }
    
    func setupSportImage() -> String {
        switch type {
        case .soccer:
            return "soccer"
        case .basketball:
            return "basketball"
        case .tennis:
            return "tennisball"
        case .none:
            return "generic"
        }
    }
    
    func handleFavorites(id: String, isFavorite: Bool) {
        var array = events
        let index = events.firstIndex { event in
            event.id == id
        } ?? 0
        
        array.remove(at: index)
        
        if isFavorite { // this is not efficient logic at all , but i couldn't find a way to make this viewModel receive isFavorite changes form EventsViewModel correctly
            array.insert(events[index], at: 0)
        } else {
            let originalPosition = sport.events?.firstIndex(where: { event in
                event.id == id
            }) ?? 0
            array.insert(events[index], at: originalPosition)
        }
        self.events = array
    }
}


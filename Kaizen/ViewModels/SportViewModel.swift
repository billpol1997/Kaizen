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
    
    func handleFavorites() {
        let array = self.events.sorted(by: {$0.isFavorite == true && $1.isFavorite == false})
        self.events = array
    }
}


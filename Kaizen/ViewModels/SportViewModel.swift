//
//  SportViewModel.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation

enum SportsEnum: String {
    case soccer = "SOCCER"
    case basketball = "BASKETBALL"
    case tennis = "TENNIS"
    case none
}

final class SportViewModel: ObservableObject {
    
    @Published var sport: Sport
    private var type: SportsEnum
    private var dataFactory = DataFactory.shared
    
    init(sport: Sport) {
        self.sport = sport
        self.type = SportsEnum(rawValue: sport.name ?? "") ?? .none
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
}


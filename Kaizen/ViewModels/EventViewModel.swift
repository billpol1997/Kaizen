//
//  EventViewModel.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation
import SwiftUI

final class EventViewModel: ObservableObject {
    @Published var event: Event
    @Published var dataFactory = DataFactory.shared
    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    
    init(event: Event) {
        self.event = event
    }
    
    func displayTime() {
        let time = dataFactory.secondsToHoursMinutesSeconds(event.startTime ?? 0)
        self.hours = time.0
        self.minutes = time.1
        self.seconds = time.2
    }
    
    func setFavorite(isFavorite: Bool) {
        event.isFavorite = isFavorite
    }
    
}

//
//  EventViewModel.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation

final class EventViewModel: ObservableObject {
    var event: Event
    var dataFactory = DataFactory.shared
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    init(event: Event) {
        self.event = event
    }
    
    func displayTime() {
        let time = dataFactory.secondsToHoursMinutesSeconds(event.startTime ?? 0)
        self.hours = time.0
        self.minutes = time.1
        self.seconds = time.2
    }
    
}

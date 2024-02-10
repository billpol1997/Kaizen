//
//  EventViewModel.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation

final class EventViewModel: ObservableObject {
    var event: Event
    
    init(event: Event) {
        self.event = event
    }
    
}

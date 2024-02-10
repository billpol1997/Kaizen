//
//  DataFactory.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation

final class DataFactory  {
    
    static let shared = DataFactory()
    
    func transformData(with initialData: [SportsModel]) -> SportsList {
       let list = SportsList(list: initialData)
        return list
    }
    
    func transformMatchTitle(with match: String) -> String {
        let title = match.replacingOccurrences(of: " - ", with: "\n")
        return title
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}

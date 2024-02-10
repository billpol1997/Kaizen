//
//  DataFactory.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation

final class DataFactory  {
    
    func transformData(with initialData: [SportsModel]) -> SportsList {
       let list = SportsList(list: initialData)
        return list
    }
}

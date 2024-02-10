//
//  HomeScreenViewModel.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation
import Combine

final class HomeScreenViewModel {
    private var manager = NetworkManager.shared
    private var dataFactory = DataFactory.shared
    private (set) var list: SportsList?
    
    func fetchSportList() async {
        do {
            let data = try await manager.fetchData()
            self.list = dataFactory.transformData(with: data)
        }
        catch {
            print("Error fetching movie list: \(error)")
        }
    }
}

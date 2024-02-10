//
//  NetworkManager.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation
import Alamofire

final class NetworkManager {
    let networkService = GenericAPICall()
    let url = "https://618d3aa7fe09aa001744060a.mockapi.io/api/sports"
    
    static let shared = NetworkManager()
    
    func fetchData() async throws -> [SportsModel] {
        let headers: HTTPHeaders = [
            "accept" : "application/json"
        ]
        let data: [SportsModel] = try await networkService.fetchData(from: url, method: .get, headers: headers ,responseModel: [SportsModel].self)
        return data
    }
}

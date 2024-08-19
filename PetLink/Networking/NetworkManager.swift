//
//  NetworkManager.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private init() {}
    
    func signUp(_ customer: Credentials, for urlString: String) async throws -> UUID {
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        let dataRequest = try encoder.encode(customer)
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        request.setValue("\(dataRequest.count)", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = dataRequest
        
        let (dataResponse, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard response.statusCode == 201 else {
            throw NetworkError.other(statusCode: response.statusCode)
        }
        
        let id = try decoder.decode(UUID.self, from: dataResponse)
        return id
    }
}

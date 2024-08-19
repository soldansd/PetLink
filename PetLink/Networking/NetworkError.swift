//
//  NetworkError.swift
//  PetLink
//
//  Created by Даниил Соловьев on 19/08/2024.
//

import Foundation

enum NetworkError: LocalizedError {
    case badURL
    case invalidResponse
    case other(statusCode: Int)
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "Invalid URL. Please check it is correct"
        case .invalidResponse:
            return "Invalid response received from server"
        case .other(let statusCode):
            return "Network error. Status code: \(statusCode)"
        }
    }
}

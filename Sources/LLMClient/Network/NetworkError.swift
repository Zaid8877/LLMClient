//
//  NetworkError.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

import Foundation

enum NetworkError: LocalizedError {
    case requestFailed(Error)
    case invalidResponse
    case noData
    case decoding(Error)
    case statusCode(Int)
    case apiError(String)

    var errorDescription: String? {
        switch self {
        case .requestFailed(let err):
            return "Request failed: \(err.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from server."
        case .noData:
            return "No data received."
        case .decoding(let err):
            return "Failed to decode response: \(err.localizedDescription)"
        case .statusCode(let code):
            return "Request failed with status code: \(code)"
        case .apiError(let message):
            return "API Error: \(message)"
        }
    }
}

//
//  NetworkError.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

import Foundation

public enum NetworkError: Error {
    case noData
    case decoding(Error)
    case requestFailed(Error)
    case invalidResponse
}

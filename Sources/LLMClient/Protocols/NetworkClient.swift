//
//  NetworkClient.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

import Foundation

public protocol NetworkClient {
    func sendRequest<T: Decodable>(
        _ request: URLRequest,
        responseType: T.Type,
        completion: @escaping @Sendable (Result<T, Error>) -> Void
    )
}

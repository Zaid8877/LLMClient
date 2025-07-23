//
//  DefaultNetworkClient.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

import Foundation

public class DefaultNetworkClient: NetworkClient {
    
    
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    
    public func sendRequest<T: Decodable>(
        _ request: URLRequest,
        responseType: T.Type
    ) async throws -> T {
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            if !(200..<300).contains(httpResponse.statusCode) {
                // Attempt to parse the error message from the response body
                if let errorMessage = try? JSONDecoder().decode(OpenAIErrorResponse.self, from: data) {
                    throw NetworkError.apiError(errorMessage.error.message)
                } else {
                    throw NetworkError.statusCode(httpResponse.statusCode)
                }
            }
            
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch let decodingError as DecodingError {
            throw NetworkError.decoding(decodingError)
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }


}
struct OpenAIErrorResponse: Decodable {
    struct APIError: Decodable {
        let message: String
    }

    let error: APIError
}



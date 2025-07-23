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

    /*public func sendRequest<T: Decodable>(
        _ request: URLRequest,
        responseType: T.Type,
        completion: @escaping @Sendable (Result<T, Error>) -> Void
    ) {
        session.dataTask(with: request) { data, response, error in
            
            func completeOnMain(_ result: Result<T, Error>) {
                let resultCopy = result // Capture local copy to ensure thread safety
                DispatchQueue.main.async {
                    completion(resultCopy)
                }
            }
            
            if let error = error {
                completeOnMain(.failure(NetworkError.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completeOnMain(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                if let data = data,
                   let serverError = try? JSONDecoder().decode(OpenAIErrorResponse.self, from: data) {
                    completeOnMain(.failure(NetworkError.apiError(serverError.error.message)))
                } else {
                    completeOnMain(.failure(NetworkError.statusCode(httpResponse.statusCode)))
                }
                return
            }
            
            guard let data = data else {
                completeOnMain(.failure(NetworkError.noData))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completeOnMain(.success(decoded))
            } catch {
                completeOnMain(.failure(NetworkError.decoding(error)))
            }
        }.resume()
    }*/
    public func sendRequest<T: Decodable>(
        _ request: URLRequest,
        responseType: T.Type
    ) async throws -> T {
        do {
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidResponse
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
    let error: OpenAIError
}

struct OpenAIError: Decodable {
    let message: String
    let type: String?
    let param: String?
    let code: String?
}

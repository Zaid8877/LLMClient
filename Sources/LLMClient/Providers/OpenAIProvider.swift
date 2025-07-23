//
//  OpenAIProvider.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

import Foundation

public class OpenAIProvider: LLMProvider {
    private let apiKey: String
    private let networkClient: NetworkClient

    public init(apiKey: String, networkClient: NetworkClient) {
        self.apiKey = apiKey
        self.networkClient = networkClient
    }

    public func sendPrompt(_ prompt: String, model: String, completion: @escaping @Sendable (Result<String, any Error>) -> Void) {
        
        var request = URLRequest(url: OpenAIConfig.apiBaseURL)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: OpenAIConfig.authHeader)
        request.addValue(OpenAIConfig.contentTypeJSON, forHTTPHeaderField: OpenAIConfig.contentTypeHeader)

        let body: [String: Any] = [
            "model": OpenAIConfig.defaultModel,
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }

        networkClient.sendRequest(request, responseType: OpenAIResponse.self) { result in
            switch result {
            case .success(let response):
                let reply = response.choices.first?.message.content ?? "No response"
                completion(.success(reply))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

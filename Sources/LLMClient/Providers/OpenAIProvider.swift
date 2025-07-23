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
        private let model: OpenAIModel

    public init(
            apiKey: String,
            model: OpenAIModel = .gpt3_5Turbo,
            networkClient: NetworkClient = DefaultNetworkClient()
        ) {
            self.apiKey = apiKey
            self.model = model
            self.networkClient = networkClient
        }

    public func sendPrompt(_ prompt: String, model: OpenAIModel) async throws -> String {
        var request = URLRequest(url: OpenAIConfig.apiBaseURL)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: OpenAIConfig.authHeader)
        request.addValue(OpenAIConfig.contentTypeJSON, forHTTPHeaderField: OpenAIConfig.contentTypeHeader)

        let body: [String: Any] = [
            "model": model.modelName,
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let response: OpenAIResponse = try await networkClient.sendRequest(
            request,
            responseType: OpenAIResponse.self
        )

        return response.choices.first?.message.content ?? "No response"
    }
}

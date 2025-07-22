//
//  OpenAIProvider.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

public class OpenAIProvider: LLMProvider {
    private let apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    public func sendPrompt(_ prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Make network request to OpenAI API here
    }
}

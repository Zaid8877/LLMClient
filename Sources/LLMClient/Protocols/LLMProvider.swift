//
//  LLMProvider.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

public protocol LLMProvider {
    func sendPrompt(_ prompt: String, model: String, completion: @escaping @Sendable (Result<String, Error>) -> Void)
}

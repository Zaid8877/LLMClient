//
//  File.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

public class GPTClient {
    private let provider: LLMProvider

    public init(provider: LLMProvider) {
        self.provider = provider
    }

    public func send(prompt: String) async throws -> String {
        try await provider.sendPrompt(prompt, model: .gpt3_5Turbo)
    }
}

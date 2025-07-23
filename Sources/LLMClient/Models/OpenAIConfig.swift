//
//  OpenAIConfig.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 22/07/2025.
//

import Foundation

internal struct OpenAIConfig {
    static let apiBaseURL = URL(string: "https://api.openai.com/v1/chat/completions")!
    static let authHeader = "Authorization"
    static let contentTypeHeader = "Content-Type"
    static let contentTypeJSON = "application/json"
    static let defaultModel = "gpt-3.5-turbo"
}

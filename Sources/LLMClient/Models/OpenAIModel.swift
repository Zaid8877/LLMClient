//
//  OpenAIModel.swift
//  LLMClient
//
//  Created by Zaid Tayyab on 23/07/2025.
//

public enum OpenAIModel: String {
    case gpt3_5Turbo = "gpt-3.5-turbo"
    case gpt4 = "gpt-4"
    case gpt4Turbo = "gpt-4-turbo"
    // Add others as needed

    public var modelName: String {
        return self.rawValue
    }
}

//
//  File.swift
//  LLMClient
//
//  Created by Usama Khan on 22/07/2025.
//

public protocol LLMProvider {
    func sendPrompt(_ prompt: String, completion: @escaping (Result<String, Error>) -> Void)
}

# 🧠 LLMClient Client

A lightweight Swift package that interacts with the OpenAI Chat Completion API using modern async/await patterns. Includes robust network abstraction and detailed error handling.

---

## ✨ Features

- 🔁 Async/await support for network requests
- 💬 Send chat prompts to OpenAI (GPT-3.5 / GPT-4)
- 🔐 API key authentication
- 📦 Modular, testable architecture
- 🛠 Custom `NetworkError` enum for granular error messages
- ✅ Codable-based response decoding

---

## 📦 Installation

### Swift Package Manager (SPM)

Add this package to your Xcode project:

1. Go to **File > Add Packages**
2. Enter the repo URL:

   ```
   https://github.com/Zaid8877/LLMClient
   ```

3. Select the version/range and add the package to your target.

---

## 🛠 Usage

### 1. Configure the Provider

```swift
let provider = OpenAIProvider(apiKey: "your-openai-api-key")

```or```

let client = GPTClient(provider: OpenAIProvider(apiKey: "your-openai-api-key", model: .gpt3_5Turbo))
```

### 2. Send a Prompt


```swift
let request = OpenAIRequest(prompt: "Tell me a joke", model: .gpt4)
let response: OpenAIResponse = try await networkClient.sendRequest(request)
```

---

## 📄 OpenAIRequest Example

```swift
struct OpenAIRequest: Encodable {
    let model: String
    let messages: [Message]
}
```

---

## 🚨 Error Handling

The `NetworkError` enum provides descriptive cases such as:

- `requestFailed(Error)`
- `invalidResponse`
- `decoding(Error)`
- `statusCode(Int)`
- `apiError(String)`

Use `error.localizedDescription` to present meaningful messages to the user or for debugging.

---

## 🔐 Get Your OpenAI API Key

1. Visit [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys)
2. Sign in and create a new API key
3. Store it securely (never commit to source control)

---

## 📚 Requirements

- iOS 13.0+ / macOS 10.15+
- Swift 5.5+
- Xcode 13+

---

## 🧪 Testing

You can create mock providers or inject a mock `URLSession` for unit testing. The architecture supports DI (Dependency Injection) for testability.

---

## 🙌 Contributing

Pull requests are welcome. Please open issues or feature requests to help improve this project.



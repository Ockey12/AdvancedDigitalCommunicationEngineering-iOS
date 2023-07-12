import Foundation

enum ApiError: Error {
    case invalidURL
    case noData
    case decodingError
    case requestFailed
    case invalidData
}

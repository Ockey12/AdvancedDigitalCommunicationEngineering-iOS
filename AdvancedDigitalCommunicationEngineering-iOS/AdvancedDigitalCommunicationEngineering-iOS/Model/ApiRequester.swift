import Foundation

struct ApiRequester {
    func requestCharacterInfo(about name: String) async throws -> CharacterInfo {
        let ipAddress = PlistAccessor.serverIpAddress

        var components = URLComponents()
        components.scheme = "http"
        components.host = ipAddress
        components.path = "/get_image/" + name

        guard let url = components.url else {
            throw ApiError.invalidURL
        }

        let (responseData, _) = try await URLSession.shared.data(from: url)

        #if DEBUG
        if let json = String(data: responseData, encoding: .utf8) {
            print("--- Response From Server ---")
            print(json)
        }
        #endif

        do {
            let decoder = JSONDecoder()
            let characterInfo = try decoder.decode(CharacterInfo.self, from: responseData)
            return characterInfo
        } catch let DecodingError.dataCorrupted(context) {
            print("Data corrupted: ", context)
            throw ApiError.decodingError
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found: ", context.debugDescription)
            print("codingPath: ", context.codingPath)
            throw ApiError.decodingError
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found: ", context.debugDescription)
            print("codingPath: ", context.codingPath)
            throw ApiError.decodingError
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch: ", context.debugDescription)
            print("codingPath: ", context.codingPath)
            throw ApiError.decodingError
        } catch {
            print("error: ", error)
            throw ApiError.decodingError
        }
    }
}

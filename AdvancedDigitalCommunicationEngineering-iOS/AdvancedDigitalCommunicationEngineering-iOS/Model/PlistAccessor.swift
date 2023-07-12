import Foundation

struct PlistAccessor {
    static var serverIpAddress: String {
        guard let filePath = Bundle.main.path(forResource: "Secret", ofType: "plist") else {
            fatalError("Couldn't find Secret.plist.")
        }

        guard let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Couldn't read Secret.plist.")
        }

        guard let ipAddress = plist["ServerIpAddress"] as? String else {
            fatalError("Failed to cast ServerIpAddress to String.")
        }

        return ipAddress
    }
}

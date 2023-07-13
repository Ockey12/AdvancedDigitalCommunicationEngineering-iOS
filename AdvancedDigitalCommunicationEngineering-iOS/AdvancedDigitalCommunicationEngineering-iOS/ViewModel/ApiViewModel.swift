import Foundation

@MainActor
class ApiViewModel {
    @Published private(set) var characterInfo: CharacterInfo

    init() {
        characterInfo = CharacterInfo()
    }

    func requestCharacterInfo(about name: String) async {
        do {
            let requester = ApiRequester()
            let info = try await requester.requestCharacterInfo(about: name)
            characterInfo = info
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

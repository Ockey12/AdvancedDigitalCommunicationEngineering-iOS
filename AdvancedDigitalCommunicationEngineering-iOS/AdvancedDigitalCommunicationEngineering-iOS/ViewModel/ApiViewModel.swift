import Foundation

@MainActor
class ApiViewModel: ObservableObject {
    @Published private(set) var characterInfo: CharacterInfo

    init() {
        characterInfo = CharacterInfo()
    }

    func requestCharacterInfo(about name: String) async -> CharacterInfo {
        do {
            let requester = ApiRequester()
            let info = try await requester.requestCharacterInfo(about: name)
            return info
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func didTapListItem(about name: String) {
        Task {
            characterInfo = await requestCharacterInfo(about: name)
        }
    }
}

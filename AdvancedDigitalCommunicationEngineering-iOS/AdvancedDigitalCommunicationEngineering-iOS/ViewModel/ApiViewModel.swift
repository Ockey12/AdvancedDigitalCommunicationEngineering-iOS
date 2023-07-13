import Foundation

@MainActor
class ApiViewModel: ObservableObject {
    @Published private(set) var characterInfo: CharacterInfo
    @Published var isReady = false

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
            await MainActor.run {
                isReady = false
            }

            characterInfo = await requestCharacterInfo(about: name)

            await MainActor.run {
                isReady = true
            }
        }
    }
}

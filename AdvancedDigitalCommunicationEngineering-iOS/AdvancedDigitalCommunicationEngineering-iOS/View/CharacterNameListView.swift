import SwiftUI

struct CharacterNameListView: View {
    @StateObject private var viewModel = ApiViewModel()
    let characters = [CharacterLocalInfo(jsonId: "guitar_hero", displayName: "後藤 ひとり", color: .pink),
                      CharacterLocalInfo(jsonId: "mama", displayName: "伊地知 虹夏", color: .yellow),
                      CharacterLocalInfo(jsonId: "yamada", displayName: "山田 リョウ", color: .blue),
                      CharacterLocalInfo(jsonId: "ikuyo", displayName: "喜多 郁代", color: .orange)
    ]

    var body: some View {
        NavigationStack {
            List(characters) { character in
                HStack {
                    Button {
                        viewModel.didTapListItem(about: character.jsonId)
                    } label: {
                        CharacterNameRowView(name: character.displayName, color: character.color)
                    }
                }
            }
        }
    }
}

struct CharacterNameListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterNameListView()
    }
}

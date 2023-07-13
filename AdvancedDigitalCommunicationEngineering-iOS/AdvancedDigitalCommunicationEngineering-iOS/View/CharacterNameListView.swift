import SwiftUI

struct CharacterNameListView: View {
    @StateObject private var viewModel = ApiViewModel()
    let characters = [CharacterLocalInfo(jsonId: "guitar_hero", displayName: "後藤 ひとり", color: Color(hexString: "#FF00FF")),
                      CharacterLocalInfo(jsonId: "mama", displayName: "伊地知 虹夏", color: Color(hexString: "#FFEA21")),
                      CharacterLocalInfo(jsonId: "yamada", displayName: "山田 リョウ", color: Color(hexString: "#00FFFF")),
                      CharacterLocalInfo(jsonId: "ikuyo", displayName: "喜多 郁代", color: Color(hexString: "#FF3300"))
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
            .navigationDestination(isPresented: $viewModel.isReady) {
                CharacterInfoView(characterInfo: viewModel.characterInfo)
            }
        }
    }
}

struct CharacterNameListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterNameListView()
    }
}

extension Color {
//    init(_ hex: Int, alpha: Double = 1) {
//        self.init(
//            .sRGB,
//            red: Double((hex >> 16) & 0xFF) / 255,
//            green: Double((hex >> 8) & 0xFF) / 255,
//            blue: Double(hex & 0xFF) / 255,
//            opacity: alpha
//        )
//    }
    init(hexString: String, alpha: CGFloat = 1.0) {
        // 不要なスペースや改行があれば除去
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        // スキャナーオブジェクトの生成
        let scanner = Scanner(string: hexString)

        // 先頭(0番目)が#であれば無視させる
        if (hexString.hasPrefix("#")) {
            scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        }

        var color:Int64 = 0
        // 文字列内から16進数を探索し、Int64型で color変数に格納
        scanner.scanHexInt64(&color)

        let mask:Int = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

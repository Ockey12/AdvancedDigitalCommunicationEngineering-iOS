import SwiftUI

struct CharacterInfoView: View {
    var characterInfo: CharacterInfo
    var body: some View {
        VStack {
            AsyncImageView(url: characterInfo.imageURL)
            Text(characterInfo.name)
            Text(characterInfo.school)
            Text(characterInfo.grade)
            Text(characterInfo.role)
            Text(characterInfo.voice)
            Text(characterInfo.comment)
        }
    }
}

struct CharacterInfoView_Previews: PreviewProvider {
    static var characterInfo = CharacterInfo(name: "後藤 ひとり",
                                             school: "秀華高校",
                                             grade: "1年生",
                                             role: "リードギター・作詞",
                                             voice: "青山吉能",
                                             comment: "絶対いやだ！働きたくない！！怖い！社会が怖い！！",
                                             imageURL: URL(string: "http://\(PlistAccessor.serverIpAddress):8000/static/guiter_hero.png")!
    )
    static var previews: some View {
        CharacterInfoView(characterInfo: characterInfo)
    }
}

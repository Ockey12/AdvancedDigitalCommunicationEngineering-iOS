import SwiftUI

struct CharacterInfoView: View {
    var characterInfo: CharacterInfo
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                AsyncImageView(url: characterInfo.imageURL)
//                    .scaledToFill()
                VStack {
                    Text(characterInfo.name)
                        .font(.system(size: 70))
                        .bold()
                    Text("CV: " + characterInfo.voice)
                }
                .foregroundColor(Color(hexString: characterInfo.fontColor))
                .frame(width: 1000)
                .background(Color(hexString: characterInfo.backgroundColor))
                .rotationEffect(Angle(degrees: -15))
                .position(x: geometry.size.width/2, y: 140)

                VStack {
                    Text(characterInfo.school + " " + characterInfo.grade)
                    Text(characterInfo.role)
                    Text(characterInfo.comment)
                    Spacer()
                }
            }
            .ignoresSafeArea(edges: [.top])
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
                                             imageURL: URL(string: "http://\(PlistAccessor.serverIpAddress):8000/static/guiter_hero.jpg")!
    )
    static var previews: some View {
        CharacterInfoView(characterInfo: characterInfo)
    }
}

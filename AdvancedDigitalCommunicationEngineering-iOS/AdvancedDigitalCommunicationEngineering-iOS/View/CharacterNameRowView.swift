import SwiftUI

struct CharacterNameRowView: View {
    let name: String
    let color: Color

    var body: some View {
        HStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(color)
            Text(name)
                .font(.system(size: 50))
        }
        .frame(height: 100)
    }
}

struct CharacterNameRowView_Previews: PreviewProvider {
    static var name = "後藤ひとり"
    static var color = Color.pink
    static var previews: some View {
        CharacterNameRowView(name: name, color: color)
    }
}

import SwiftUI

struct CharacterNameRowView: View {
    let name: String
    let color: Color

    var body: some View {
        HStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(color)
            Text(name)
                .font(.system(size: 30))
                .foregroundColor(.black)
            Spacer()

            Image(systemName: "chevron.right")
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

import SwiftUI

struct ApiViewModelTestView: View {
    @StateObject private var viewModel = ApiViewModel()

    var body: some View {
        Button {
            viewModel.didTapListItem(about: "guitar_hero")
        } label: {
            Text("guitar_hero")
        }

    }
}

struct ApiViewModelTestView_Previews: PreviewProvider {
    static var previews: some View {
        ApiViewModelTestView()
    }
}

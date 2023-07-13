import SwiftUI

struct AsyncImageView: View {
    @StateObject private var imageLoader = ImageLoader()

    let url: URL

    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if imageLoader.isLoading {
                ProgressView()
            } else {
                Image(systemName: "photo")
            }
        }
        .onAppear {
            imageLoader.load(from: url)
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(url: URL(string: "http://\(PlistAccessor.serverIpAddress):8000/static/guiter_hero.png")!)
    }
}

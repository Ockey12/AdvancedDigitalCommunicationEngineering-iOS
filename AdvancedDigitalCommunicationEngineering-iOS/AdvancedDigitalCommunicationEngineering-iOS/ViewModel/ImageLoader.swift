import Foundation
import SwiftUI

class ImageLoader {
    @Published var image: UIImage?
    @Published var isLoading = false

    private var task: Task<Void, Never>?

    /// ロード状態にする
    /// loadImageメソッドを呼び出してURLから画像を取得する
    func load(from url: URL) {
        guard task == nil else { return }

        isLoading = true
        task = Task {
            await loadImage(from: url)
        }
    }

    /// URLから画像を取得する
    /// 返り値を介さず，imageプロパティを直接更新する
    /// ロード状態を解除する
    private func loadImage(from url: URL) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                self.image = image
                self.isLoading = false
            }
        } catch {
            print("Failed to load image from \(url): \(error)")
            self.isLoading = false
        }
    }

    func cancel() {
        task?.cancel()
        task = nil
    }
}

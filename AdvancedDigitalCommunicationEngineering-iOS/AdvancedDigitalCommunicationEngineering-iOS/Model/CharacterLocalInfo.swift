import Foundation
import SwiftUI

struct CharacterLocalInfo: Identifiable {
    let id = UUID()
    let jsonId: String
    let displayName: String
    let color: Color
}

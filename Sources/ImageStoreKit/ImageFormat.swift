import Foundation

public enum ImageFormat {
    case png
    case jpg(compressionQuality: CGFloat)

    public var fileExtension: String {
        switch self {
        case .png: return "png"
        case .jpg: return "jpg"
        }
    }
}

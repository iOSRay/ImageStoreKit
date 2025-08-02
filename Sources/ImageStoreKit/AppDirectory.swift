import Foundation

public enum AppDirectory {
    case documents(sub: String? = nil)
    case caches(sub: String? = nil)

    public var url: URL {
        let base: FileManager.SearchPathDirectory = {
            switch self {
            case .documents: return .documentDirectory
            case .caches: return .cachesDirectory
            }
        }()
        var url = FileManager.default.urls(for: base, in: .userDomainMask).first!
        switch self {
        case .documents(let sub), .caches(let sub):
            if let sub = sub {
                url.appendPathComponent(sub, isDirectory: true)
            }
        }
        return url
    }
}

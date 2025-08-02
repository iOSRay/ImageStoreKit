import Foundation
import UIKit

public class ImageStore {
    public static let shared = ImageStore()

    public func save(
        image: UIImage,
        to directory: AppDirectory = .documents(sub: "Images"),
        format: ImageFormat = .jpg(compressionQuality: 0.8),
        includeThumbnail: Bool = true,
        completion: @escaping (SavedImageInfo?) -> Void
    ) {
        ImageTaskQueue.shared.addTask {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let folderName = formatter.string(from: date)
            let baseURL = directory.url.appendingPathComponent(folderName, isDirectory: true)

            do {
                try FileManager.default.createDirectory(at: baseURL, withIntermediateDirectories: true)

                let timestamp = Int(Date().timeIntervalSince1970 * 1000)
                let ext = format.fileExtension
                let fileName = "\(timestamp).\(ext)"
                let fileURL = baseURL.appendingPathComponent(fileName)

                let data: Data?
                switch format {
                case .jpg(let quality):
                    data = image.jpegData(compressionQuality: quality)
                case .png:
                    data = image.pngData()
                }

                guard let imageData = data else {
                    DispatchQueue.main.async { completion(nil) }
                    return
                }

                try imageData.write(to: fileURL)
                let thumbnail = includeThumbnail ? image.resized(to: CGSize(width: 80, height: 80)) : nil
                let info = SavedImageInfo(
                    url: fileURL,
                    size: image.size,
                    dataSize: imageData.count,
                    thumbnail: thumbnail
                )

                DispatchQueue.main.async {
                    completion(info)
                }

            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}

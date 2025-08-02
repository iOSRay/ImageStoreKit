import Foundation

final class ImageTaskQueue {
    static let shared = ImageTaskQueue()
    private let queue = DispatchQueue(label: "com.imagestorekit.queue", qos: .utility)

    func addTask(_ block: @escaping () -> Void) {
        queue.async {
            block()
        }
    }
}

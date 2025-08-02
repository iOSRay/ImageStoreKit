import XCTest
@testable import ImageStoreKit
import UIKit

final class ImageStoreKitTests: XCTestCase {
    func testSaveImage() {
        let image = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100)).image { ctx in
            UIColor.red.setFill()
            ctx.fill(CGRect(x: 0, y: 0, width: 100, height: 100))
        }

        let expectation = XCTestExpectation(description: "Save image should succeed")

        _ = ImageStore.shared.saveImageTask(image, to: "TestFolder", format: .png) { result in
            switch result {
            case .success(let info):
                print("✅ Saved at: \(info.fullPath)")
                XCTAssertTrue(info.size.width == 100)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Saving failed: \(error)")
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }
}

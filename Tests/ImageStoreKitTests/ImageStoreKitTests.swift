import XCTest
@testable import ImageStoreKit
import UIKit

final class ImageStoreKitTests: XCTestCase {
    func testSaveJPGImage() {
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContext(size)
        UIColor.blue.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        let expectation = self.expectation(description: "Save image")
        ImageStore.shared.save(image: image!, format: .jpg(compressionQuality: 0.9)) { info in
            XCTAssertNotNil(info)
            XCTAssertTrue(FileManager.default.fileExists(atPath: info!.url.path))
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
}

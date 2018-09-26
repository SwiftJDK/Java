// import XCTest
@testable // import SwiftJDK

final class SwiftJDKTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftJDK().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}

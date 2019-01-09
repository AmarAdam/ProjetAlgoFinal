import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(library_Bahroun_RanarimahefaTests.allTests),
    ]
}
#endif
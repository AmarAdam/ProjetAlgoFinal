import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Tests_Bahroun_RanarimahefaTests.allTests),
    ]
}
#endif
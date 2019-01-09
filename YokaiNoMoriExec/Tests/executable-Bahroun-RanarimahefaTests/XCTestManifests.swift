import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(executable_Bahroun_RanarimahefaTests.allTests),
    ]
}
#endif
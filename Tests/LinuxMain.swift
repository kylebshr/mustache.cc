import XCTest

import cycling_webTests

var tests = [XCTestCaseEntry]()
tests += mustacheTests.allTests()
XCTMain(tests)

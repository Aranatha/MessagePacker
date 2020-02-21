//
//  BinaryUnpackedTests.swift
//  MessagePackerTests
//
//  Created by Hirotaka Nishiyama on 2018/11/14.
//  Copyright © 2018年 hiro. All rights reserved.
//

import XCTest
@testable import MessagePacker

class BinaryUnpackedTests: XCTestCase {
    let decoder = MessagePackDecoder()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testBinary8() {
        let input = Data([196, 5, 0, 1, 2, 3, 4])
        let output = Data([0, 1, 2, 3, 4])
        XCTAssertEqual(try decoder.decode(Data.self, from: input), output)
    }

    func testLenientStringAsBinary() {
		// try parsing old data encoded as "raw" (raw markers have become string markers and binary markers use other values now)
        let input = Data([165, 0, 1, 2, 3, 4])
        let output = Data([0, 1, 2, 3, 4])
        XCTAssertEqual(try decoder.decode(Data.self, from: input), output)
    }
}

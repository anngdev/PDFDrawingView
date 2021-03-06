//
//  TestExtensions.swift
//  SamplePDFDrawingViewAppTests
//
//  Created by Jack Rosen on 3/24/19.
//  Copyright © 2019 Jack Rosen. All rights reserved.
//

import XCTest
@testable import DrawingPDF

class TestExtensions: XCTestCase {
	func testCGPoint() {
		let point = CGPoint(x: 10, y: 10)
		XCTAssert(point.subtract(point: CGPoint.zero) == point)
		XCTAssert(point.subtract(point: point) == CGPoint.zero)
		XCTAssert(point.subtract(point: CGPoint(x: -5, y: 12)) == CGPoint(x: 15, y: -2))
		XCTAssert(point.addIncrements(amount: 2, until: CGPoint.zero) == [CGPoint.zero])
		XCTAssert(point.addIncrements(amount: 4, until: CGPoint.zero) == [CGPoint(x: 5, y: 5), CGPoint(x: 2.5, y: 2.5), CGPoint.zero])
		XCTAssert(point.distance(to: CGPoint.zero) == CGVector(dx: -10, dy: -10))
		XCTAssert(point.midPoint(with: CGPoint.zero) == CGPoint(x: 5, y: 5))
		XCTAssert(point.shiftDownBy(0, 10) == point + CGVector(dx: 0, dy: -10))
		XCTAssert(point.shiftUpBy(0, 10) == point + CGVector(dx: 0, dy: 10))
	}
	
	func testCGVector() {
		let vector = CGVector(dx: 10, dy: 10)
		XCTAssert(vector.normalized() == CGVector(dx: -10, dy: 10))
		XCTAssert(vector.normalized().unitize() == CGVector(dx: -10 / sqrt(200), dy: 10 / sqrt(200)))
	}
}

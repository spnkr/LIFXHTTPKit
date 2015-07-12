//
//  Created by Tate Johnson on 14/06/2015.
//  Copyright (c) 2015 Tate Johnson. All rights reserved.
//

import XCTest
import LIFXHTTPKit

class LightTargetTests: XCTestCase {
	func testSetPower() {
		let expectation = expectationWithDescription("setPower")
		if let lightTarget = ClientHelper.sharedClient.allLightTarget().toLightTargets().first {
			let newPower = !lightTarget.power
			lightTarget.setPower(newPower, duration: 0.0, completionHandler: { (results, error) in
				dispatch_async(dispatch_get_main_queue()) {
					XCTAssertEqual(newPower, lightTarget.power, "power is new value after operation is completed")
					expectation.fulfill()
				}
			})
			XCTAssertEqual(newPower, lightTarget.power, "power is optimstically set to new value")
		}
		waitForExpectationsWithTimeout(3.0, handler: nil)
	}

	func testSetColor() {
		let expectation = expectationWithDescription("setColor")
		if let lightTarget = ClientHelper.sharedClient.allLightTarget().toLightTargets().first {
			let newColor = Color.color(Double(arc4random_uniform(360)), saturation: 0.5)
			lightTarget.setColor(newColor, duration: 0.0, completionHandler: { (results, error) in
				dispatch_async(dispatch_get_main_queue()) {
					XCTAssertEqual(newColor.hue, lightTarget.color.hue, "hue is new value after operation is completed")
					expectation.fulfill()
				}
			})
			XCTAssertEqual(newColor.hue, lightTarget.color.hue, "hue is optimsitically set to new value")
		}
		waitForExpectationsWithTimeout(3.0, handler: nil)
	}
}

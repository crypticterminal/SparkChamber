/**
 *  SparkViewControllerTests.swift
 *  SparkKitTests
 *
 *  Created by Steve Elliott on 10/05/2016.
 *  Copyright (c) 2016 eBay Software Foundation.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 **/

import XCTest
import SparkChamber
@testable import SparkKit


class SparkViewControllerTests: XCTestCase {
	func testSparkViewControllerViewDidAppear() {
		let viewController = SparkViewController()
		let view = UIView()
		viewController.view.addSubview(view)
		
		let expectation: XCTestExpectation = expectationWithDescription("A SparkViewController's appear action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.DidAppear, trace: "view displayed") {
			_ in
			expectation.fulfill()
		}
		view.sparkEvents = [sparkEvent]
		
		viewController.viewDidAppear(false)
		
		waitForExpectationsWithTimeout(3.0, handler: nil)
	}
	
	func testSparkViewControllerViewDidDisppear() {
		let viewController = SparkViewController()
		let view = UIView()
		viewController.view.addSubview(view)
		
		let expectation: XCTestExpectation = expectationWithDescription("A SparkViewController's disappear action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.DidDisappear, trace: "view disappeared") {
			_ in
			expectation.fulfill()
		}
		view.sparkEvents = [sparkEvent]
		
		viewController.viewDidDisappear(false)
		
		waitForExpectationsWithTimeout(3.0, handler: nil)
	}
}

//
//  PinAutoLayoutCenteringTest.swift
//  PinAutoLayout
//
//  Created by Haizhen Lee on 16/1/17.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import XCTest

class PinAutoCenteringTest: PinAutoTestBase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_pa_center_XX() {
      viewA.pa_width.eq(100).install()
      viewA.pa_height.eq(100).install()
      viewA.pa_centerX.install()
      viewA.pa_centerY.install()
      evaluateConstraints()
      assertCenterInSuperView(viewA)
      assertFrameEqual(viewA, x: 450, y: 450, width: 100, height: 100)
      
      viewB.pa_width.eq(80).install()
      viewB.pa_height.eq(124).install()
      viewB.pa_centerX.install()
      viewB.pa_centerY.install()
      evaluateConstraints()
      assertCenterInSuperView(viewB)
      assertFrameEqual(viewB, x: 460, y: 438, width: 80, height: 124)
    }
}

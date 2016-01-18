//
//  PinAutoLayoutSizeTests.swift
//  PinAutoLayout
//
//  Created by Haizhen Lee on 16/1/17.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import XCTest

class PinAutoSizeTests: PinAutoTestBase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  
  func testWidth() {
    viewA.pa_width.eq(100).install()
    viewB.pa_width.eq(160).install()
    viewC.pa_width.eq(120).install()
    
    
    evaluateConstraints()
    
    assertWidthEqual(viewA, width: 100)
    assertWidthEqual(viewB, width: 160)
    assertWidthEqual(viewC, width: 120)
  }
  
  func testHeight() {
    viewA.pa_height.eq(100).install()
    viewB.pa_height.eq(160).install()
    viewC.pa_height.eq(120).install()
    
    
    evaluateConstraints()
    
    assertHeightEqual(viewA, height: 100)
    assertHeightEqual(viewB, height: 160)
    assertHeightEqual(viewC, height: 120)
  }
  
}

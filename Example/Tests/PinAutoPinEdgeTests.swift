//
//  PinAutoLayoutPinEdgeTests.swift
//  PinAutoLayout
//
//  Created by Haizhen Lee on 16/1/17.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import XCTest

class PinAutoPinEdgeTests: PinAutoTestBase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testLeading() {
    viewA.pa_leading.eq(15).install()
    viewB.pa_leading.install()
    viewC.pa_leading.gte(150).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewA, originX: 15)
    assertOriginXEqual(viewB, originX: 0)
    assertOriginXEqual(viewC, originX: 150)
  }
  
  func testLeft() {
    viewA.pa_left.eq(15).install()
    viewB.pa_left.install()
    viewC.pa_left.gte(150).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewA, originX: 15)
    assertOriginXEqual(viewB, originX: 0)
    assertOriginXEqual(viewC, originX: 150)
  }
  
  
  
  func testTrailing(){
    viewA.pa_trailing.eq(15).install()
    viewB.pa_trailing.install()
    viewC.pa_trailing.gte(50).install()
    
    evaluateConstraints()
    
    assertMaxXEqual(viewA, maxX: containerViewWidth - 15)
    assertMaxXEqual(viewB, maxX: containerViewWidth)
    assertMaxXEqual(viewC, maxX: containerViewWidth - 50)
  }
  
  func testRight(){
    viewA.pa_right.eq(15).install()
    viewB.pa_right.install()
    viewC.pa_right.gte(50).install()
    
    evaluateConstraints()
    
    assertMaxXEqual(viewA, maxX: containerViewWidth - 15)
    assertMaxXEqual(viewB, maxX: containerViewWidth)
    assertMaxXEqual(viewC, maxX: containerViewWidth - 50)
  }
  
  func testTop(){
    viewA.pa_top.eq(15).install()
    viewB.pa_top.install()
    viewC.pa_top.eq(100).install()
    
    evaluateConstraints()
    
    assertOriginYEqual(viewA, originY: 15)
    assertOriginYEqual(viewB, originY: 0)
    assertOriginYEqual(viewC, originY: 100)
  }
  
  func testBottom(){
    viewA.pa_bottom.eq(15).install()
    viewB.pa_bottom.install()
    viewC.pa_bottom.eq(100).install()
    viewD.pa_bottom.eq(50).withLowPriority.install()
    viewD.pa_bottom.eq(60).withHighPriority.install()
    
    evaluateConstraints()
    
    assertMaxYEqual(viewA, maxY: containerViewHeight - 15)
    assertMaxYEqual(viewB, maxY: containerViewHeight)
    assertMaxYEqual(viewC, maxY: containerViewHeight - 100)
    assertMaxYEqual(viewD, maxY: containerViewHeight - 60)
  }
  
}

//
//  PinAutoLayoutSiblingTests.swift
//  PinAutoLayout
//
//  Created by Haizhen Lee on 16/1/17.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import XCTest
import UIKit

class PinAutoSiblingTests: PinAutoTestBase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testToRightOf() {
    viewA.pa_left.install()
    viewA.pa_width.eq(100).install()
    viewB.pa_toRightOf(viewA, offset: 10).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewB, originX: 110)
  }
  
  func testToLeftOf(){
    viewA.pa_right.install()
    viewA.pa_width.eq(100).install()
    viewB.pa_toLeftOf(viewA, offset: 10).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewB, originX: containerViewWidth - 110)
    
  }
 
  func testToTrailingOf() {
    viewA.pa_leading.install()
    viewA.pa_width.eq(100).install()
    viewB.pa_toTrailingOf(viewA, offset: 10).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewB, originX: 110)
  }
  
  func testAfter(){
    viewA.pa_leading.install()
    viewA.pa_width.eq(100).install()
    viewB.pa_after(viewA, offset: 10).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewB, originX: 110)
  }
  
  func testToLeadingOf(){
    viewA.pa_trailing.install()
    viewA.pa_width.eq(100).install()
    viewB.pa_toLeadingOf(viewA, offset: 10).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewB, originX: containerViewWidth - 110)
    
  }
  
  func testBefore(){
    viewA.pa_trailing.install()
    viewA.pa_width.eq(100).install()
    viewB.pa_before(viewA, offset: 10).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewB, originX: containerViewWidth - 110)
  }
  
  func testAbove(){
    viewA.pa_bottom.install()
    viewA.pa_height.eq(100).install()
    
    viewB.pa_above(viewA, offset: 50).install()
    viewC.pa_above(viewA).install()
    
    evaluateConstraints()
    
    assertMaxYEqual(viewB, maxY: containerViewHeight - 150)
    assertMaxYEqual(viewC, maxY: containerViewHeight - 100)
    
  }
  
  func testBelow(){
    viewA.pa_top.install()
    viewA.pa_height.eq(100).install()
    
    viewB.pa_below(viewA).install()
    viewC.pa_below(viewA, offset: 50).install()
    
    evaluateConstraints()
    
    assertOriginYEqual(viewB, originY: 100)
    assertOriginYEqual(viewC, originY: 150)
    
  }
  
  func testEqualLeading(){
    viewA.pa_leading.eq(100).install()
    
    viewB.pa_leading.equalTo(viewA).install()
    viewC.pa_leading.equalTo(viewA).offset(20).install()
    viewD.pa_leading.equalTo(viewA).offset(-20).install()
    
    evaluateConstraints()
    
    assertOriginXEqual(viewA, originX: 100)
    assertOriginXEqual(viewB, originX: 100)
    assertOriginXEqual(viewC, originX: 120)
    assertOriginXEqual(viewD, originX: 80)
  }
  
  func testEqualTop(){
    viewA.pa_top.eq(100).install()
    
    viewB.pa_top.equalTo(viewA).install()
    viewC.pa_top.equalTo(viewA).offset(50).install()
    viewD.pa_top.equalTo(viewA).offset(-10).install()
    
    evaluateConstraints()
    assertOriginYEqual(viewA, originY: 100)
    assertOriginYEqual(viewB, originY: 100)
    assertOriginYEqual(viewC, originY: 150)
    assertOriginYEqual(viewD, originY: 90)
  }
  
  func testEqualTrailing(){
    viewA.pa_trailing.eq(15).install()
    
    viewB.pa_trailing.equalTo(viewA).offset(15).install()
    viewC.pa_trailing.equalTo(viewA).install()
    viewD.pa_trailing.equalTo(viewA).offset(-5).install()
    
    evaluateConstraints()
    
    assertMaxXEqual(viewA, maxX: containerViewWidth - 15)
    assertMaxXEqual(viewB, maxX: containerViewWidth  - 30)
    assertMaxXEqual(viewC, maxX: containerViewWidth - 15)
    assertMaxXEqual(viewD, maxX: containerViewWidth - 10)
    
  }
  
  func testEqualBottom(){
    viewA.pa_bottom.eq(100).install()
    
    viewB.pa_bottom.equalTo(viewA).offset(50).install()
    viewC.pa_bottom.equalTo(viewA).offset(-50).install()
    viewD.pa_bottom.equalTo(viewA).install()
    
    evaluateConstraints()
    
    assertMaxYEqual(viewA, maxY: containerViewHeight - 100)
    assertMaxYEqual(viewB, maxY: containerViewHeight - 150)
    assertMaxYEqual(viewC, maxY: containerViewHeight - 50)
    assertMaxYEqual(viewD, maxY: containerViewHeight - 100)
  }
}

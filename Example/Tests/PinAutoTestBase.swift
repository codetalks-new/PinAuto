//
//  PinAutoLayoutTestBase.swift
//  PinAutoLayout
//
//  Created by Haizhen Lee on 16/1/17.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

// Inspired by PureLayout

import XCTest
import UIKit
import PinAuto


let containerViewWidth :CGFloat = 1000
let containerViewHeight: CGFloat = 1000

class PinAutoTestBase: XCTestCase {
  
  let viewA = UIView()
  let viewA_A = UIView()
  let viewA_A_A = UIView()
  let viewA_A_B = UIView()
  let viewA_B = UIView()
  let viewA_B_A = UIView()
  
  let viewB = UIView()
  let viewB_A = UIView()
  let viewC = UIView()
  let viewD = UIView()
  
  let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerViewWidth, height: containerViewHeight))
  
  var topViews:[UIView] {
    return [viewA,viewB,viewC,viewD]
  }
  
  
  override func setUp() {
    super.setUp()
    setupViewHierarchy()
  }
  
  func setupViewHierarchy(){
    for view in topViews{
      containerView.addSubview(view)
    }
    viewA.addSubview(viewA_A)
    viewA.addSubview(viewA_B)
    viewA_A.addSubview(viewA_A_A)
    viewA_A.addSubview(viewA_A_B)
    viewA_B.addSubview(viewA_B_A)
    
    viewB.addSubview(viewB_A)
  }
  
  /**
   Test the default view hierarchy to make sure it is correctly established.
   */
  func  testViewHierarchy(){
    XCTAssertNotNil(self.containerView, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewA.superview == self.containerView, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewA_A.superview == self.viewA, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewA_A_A.superview == self.viewA_A, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewA_A_B.superview == self.viewA_A, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewA_B.superview == self.viewA, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewA_B_A.superview == self.viewA_B, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewB.superview == self.containerView, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewB_A.superview == self.viewB, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewC.superview == self.containerView, "View hierarchy is not setup as expected.");
    XCTAssert(self.viewD.superview == self.containerView, "View hierarchy is not setup as expected.");
  }
  
  /**
   Forces the container view to immediately do a layout pass, which will evaluate the constraints and set the frames for the container view and subviews.
   */
  func evaluateConstraints() {
    self.evaluateConstraintsForView(self.containerView)
  }
  

  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
}

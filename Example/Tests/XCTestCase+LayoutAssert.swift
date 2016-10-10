//
//  XCTestCase+LayoutAssert.swift
//  PinAutoLayout
//
//  Created by Haizhen Lee on 16/1/17.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import XCTest


let epsilon:CGFloat = 1.0

func roundedEquals(_ a:CGFloat,b:CGFloat) -> Bool{
  return fabs(a - b) < epsilon
}


extension XCTestCase{
  
  func assertFrameEqual(_ view:UIView,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat){
    XCTAssert(roundedEquals(view.frame.minX, b: x) && roundedEquals(view.frame.minY, b: y)
      && roundedEquals(view.frame.width, b: width) && roundedEquals(view.frame.height, b: height)
    )
  }
  
  func assertOriginEqual(_ view:UIView,x:CGFloat,y:CGFloat){
    XCTAssert(roundedEquals(view.frame.minX, b: x) && roundedEquals(view.frame.minY, b: y))
  }
  
  func assertHeightEqual(_ view:UIView,height:CGFloat){
    XCTAssert(roundedEquals(view.frame.height, b: height))
  }
  
  func assertWidthEqual(_ view:UIView,width:CGFloat){
    XCTAssert(roundedEquals(view.frame.width, b: width),"view frame was \(view.frame)")
  }
  
  func assertSizeEqual(_ view:UIView,width:CGFloat,height:CGFloat){
    XCTAssert(roundedEquals(view.frame.width, b: width) && roundedEquals(view.frame.height, b: height))
  }
  
  func assertMaxEqual(_ view:UIView,maxX:CGFloat,maxY:CGFloat){
    XCTAssert(roundedEquals(view.frame.maxX, b: maxX) && roundedEquals(view.frame.maxY, b: maxY))
  }
  
  func assertMaxYEqual(_ view:UIView,maxY:CGFloat){
    XCTAssert(roundedEquals(view.frame.maxY, b: maxY),"view frame was \(view.frame)")
  }
  
  func assertMaxXEqual(_ view:UIView,maxX:CGFloat){
    XCTAssert(roundedEquals(view.frame.maxX, b: maxX))
  }
  
  func assertCenterEqual(_ view:UIView,centerX:CGFloat,centerY:CGFloat){
    XCTAssert(roundedEquals(view.frame.midX, b: centerX) && roundedEquals(view.frame.midY, b: centerY))
  }
  
  func assertCenterEqual(_ view:UIView,center:CGPoint){
    XCTAssert(roundedEquals(view.frame.midX, b: center.x) && roundedEquals(view.frame.midY, b: center.y))
  }
  
  func assertCenterXEqual(_ view:UIView,centerX:CGFloat){
    XCTAssert(roundedEquals(view.frame.midX, b: centerX))
  }
  
  func assertCenterYEqual(_ view:UIView,centerY:CGFloat){
    XCTAssert(roundedEquals(view.frame.midY, b: centerY))
  }
  
  func assertOriginYEqual(_ view:UIView,originY:CGFloat){
    XCTAssert(roundedEquals(view.frame.origin.y, b: originY))
  }
  
  func assertOriginXEqual(_ view:UIView,originX:CGFloat){
    XCTAssert(roundedEquals(view.frame.origin.x, b: originX),"view frame is \(view.frame)")
  }
  
  func assertCenterInSuperView(_ view:UIView){
    let superview = view.superview!
    assertCenterEqual(view, center: superview.center)
  }
}

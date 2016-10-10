//
//  XCTTestCase+LayoutHelper.swift
//  PinAutoLayout
//
//  Created by Haizhen Lee on 16/1/17.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit

import XCTest

extension XCTestCase{
  /**
   Recursively forces the given view and its subviews to immediately do a layout pass (evaluate the constraints and update frames).
   */
  func evaluateConstraintsForView(_ view:UIView) {
    for subview in view.subviews {
      evaluateConstraintsForView(subview)
    }
    view.setNeedsLayout();
    view.layoutIfNeeded();
  }
}

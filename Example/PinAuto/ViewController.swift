//
//  ViewController.swift
//  PinAuto
//
//  Created by banxi1988 on 01/17/2016.
//  Copyright (c) 2016 banxi1988. All rights reserved.
//

import UIKit
import PinAuto

class ViewController: UIViewController {
  
  lazy var label1 : UILabel = {
    let label = UILabel()
    self.view.addSubview(label)
    label.text = "1:pa_below(topLayougGuide), pa_leading.eq(30)"
    
    label.pa_below(self.topLayoutGuide).install()
    label.pa_leading.eq(30).install()
    return label
  }()
  
  lazy var label2 : UILabel = {
    let label = UILabel()
    self.view.addSubview(label)
    label.text = "2:pa_below(topLayougGuide,offset:40), pa_leading.eq(15),pa_trailing.eq(15)"
    label.numberOfLines = 2
    
    label.pa_below(self.topLayoutGuide,offset:40).install()
    label.pa_leading.eq(15).install()
    label.pa_trailing.eq(15).install()
    return label
  }()
  
  lazy var label3 : UILabel = {
    let label = UILabel()
    self.view.addSubview(label)
    label.text = "3:pa_below(label2,offset:8), pa_leading.eq(15),pa_trailing.eq(15)"
    label.numberOfLines = 2
    
    label.pa_below(self.label2,offset:8).install()
    label.pa_leading.eq(15).install()
    label.pa_trailing.eq(15).install()
    return label
  }()
  
  lazy var label4 : UILabel = {
    let label = UILabel()
    self.view.addSubview(label)
    label.text = "4:pa_below(label3,offset:8), pa_width.eq(160),pa_centerX"
    label.numberOfLines = 3
    
    label.pa_below(self.label3,offset:8).install()
    label.pa_width.eq(160).install()
    label.pa_centerX.install()
    return label
  }()
  
  lazy var label5 : UILabel = {
    let label = UILabel()
    self.view.addSubview(label)
    label.text = "5:pa_below(label4,offset:16), pa_width.eq(240),pa_aspectRatio(0.5),pa.centerX"
    label.numberOfLines = 0
    label.textAlignment = .center
    
    label.pa_below(self.label4,offset:16).install()
    label.pa_width.eq(240).install()
    label.pa_aspectRatio(0.5).install()
    label.pa_centerX.install()
    return label
  }()
  
  lazy var label6 : UILabel = {
    let label = UILabel()
    self.view.addSubview(label)
    label.text = "6:pa_above(bottomLayoutGuide)\npa_width.eq(120)\npa_leading.eq(15)"
    label.numberOfLines = 0
    label.textAlignment = .left
    
    label.pa_above(self.bottomLayoutGuide, offset: 30).install()
    label.pa_width.eq(120).install()
    label.pa_leading.eq(15).install()
    return label
  }()
  
  lazy var label7 : UILabel = {
    let label = UILabel()
    self.view.addSubview(label)
    label.text = "7:pa_centerY.equalTo(label6)\nlabel.pa_toRightOf(label6,offset:15)\npa_width.eq(120)\n"
    label.numberOfLines = 0
    label.textAlignment = .left
    
    label.pa_centerY.equalTo(self.label6).install()
    label.pa_toRightOf(self.label6, offset: 15).install()
    label.pa_width.eq(120).install()
    return label
  }()
  
  var labels:[UILabel]{
    return [label1,label2,label3,label4,label5,label6,label7]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let bgColors = (1..<20).map{  CGFloat($0) * 0.02}.map{ UIColor(white: $0, alpha: 1.0) }
    
    for label in labels{
      label.font = UIFont.systemFont(ofSize: 13)
      label.textColor = UIColor(white: 1.0, alpha: 1.0)
      let index = Int(arc4random_uniform(UInt32(bgColors.count)))
      let bgColor = bgColors[index]
      label.backgroundColor = bgColor
    }
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}


class MyViewController:UIViewController{
  lazy var box = UIView()
  
  override func loadView() {
    super.loadView()
    self.view.addSubview(box)
    box.pa_width.eq(100).install()
    box.pa_height.eq(100).install()
    box.pa_centerX.install()
    box.pa_centerY.install()
  }
  
}


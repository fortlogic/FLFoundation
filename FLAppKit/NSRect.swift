//
//  NSRect.swift
//  FLAppKit
//
//  Created by Matias Eyzaguirre on 2017-10-16.
//  Copyright © 2017 Matias Eyzaguirre. All rights reserved.
//

import Foundation

public extension NSRect {
  public init(center: NSPoint, radius: CGFloat) {
    let minX = center.x - radius
    let minY = center.y - radius
    self.init(x: minX, y: minY, width: radius*2, height: radius*2)
  }
  
  public init(center: NSPoint, diameter: CGFloat) {
    let minX = center.x - (diameter / 2.0)
    let minY = center.y - (diameter / 2.0)
    self.init(x: minX, y: minY, width: diameter, height: diameter)
  }
  
  public init(center: NSPoint, width: CGFloat, height: CGFloat) {
    let originX = center.x - (width / 2.0)
    let originY = center.y - (height / 2.0)
    self.init(x: originX, y: originY, width: width, height: height)
  }
}

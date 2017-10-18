//
//  NSEvent.swift
//  FLFoundation
//
//  Created by Matias Eyzaguirre on 2017-10-16.
//  Copyright © 2017 Matias Eyzaguirre. All rights reserved.
//

import AppKit

public extension NSEvent {
  public func location(inView view: NSView) -> NSPoint {
    let location = self.locationInWindow
    return view.convert(location, from: nil)
  }
}

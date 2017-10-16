//
//  NSEvent.swift
//  FLFoundation
//
//  Created by Matias Eyzaguirre on 2017-10-16.
//  Copyright © 2017 Matias Eyzaguirre. All rights reserved.
//

import AppKit

extension NSEvent {
  func location(inView view: NSView) -> NSPoint {
    let location = self.locationInWindow
    return view.convert(location, from: nil)
  }
}

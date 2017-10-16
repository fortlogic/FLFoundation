//
//  NSGraphicsContext.swift
//  FLAppKit
//
//  Created by Matias Eyzaguirre on 2017-10-16.
//  Copyright © 2017 Matias Eyzaguirre. All rights reserved.
//

import AppKit

extension NSGraphicsContext {
  func with(compositingOperation: NSCompositingOperation, thunk: () -> ()) {
    let previous = self.compositingOperation
    self.compositingOperation = compositingOperation
    thunk()
    self.compositingOperation = previous
  }
}

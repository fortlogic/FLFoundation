//
//  URLTests.swift
//  FLFoundationTests
//
//  Created by Matias Eyzaguirre on 9/22/17.
//  Copyright © 2017 Matias Eyzaguirre. All rights reserved.
//

import XCTest

import FLFoundation

class URLTests: XCTestCase {
  
  func testVolumeUUID() {
    // Get the main bundle
    let url = Bundle.main.bundleURL
    
    // The volumeUUID of the main bundle should have 36 chars.
    let uuid = url.volumeUUID
    XCTAssertEqual(uuid?.uuidString.count, 36, "Main bundle's URL's volume UUID has 36 characters")
    
    // This file path shouldn't correspond to a file, therefore it shouldn't have a volumeUUID
    let badFile = URL(fileURLWithPath:"/tmp/IHopeThisFileDoesntExist")
    
    // url's that don't have a file don't have a volumeUUID
    do {
      // this should throw a thing
      let _ = try badFile.checkResourceIsReachable()
      // if we get to here then the file exists D:
      XCTFail("badFile.checkResourceIsReachable() didn't throw a file-not-found")
    } catch {
      XCTAssertNil(badFile.volumeUUID)
    }
  }
  
}

//
//  URL.swift
//  FLFoundation
//
//  Created by Matias Eyzaguirre on 9/22/17.
//  Copyright © 2017 Matias Eyzaguirre. All rights reserved.
//

import Foundation

public extension URL {
  
  
  /// The UUID of the volume that the URL points to. If the URL is not a file URL or the file  then this returns
  /// nil.
  var volumeUUID: UUID? {
    
    // if we aren't a file URL then there's no volume
    guard self.isFileURL else {
      return nil
    }
    
    if let session = DASessionCreate(kCFAllocatorDefault) {
      var fsStats = UnsafeMutablePointer<statfs>.allocate(capacity: 1)
      defer { fsStats.deinitialize(count: 1) }
      if statfs((path as NSString).utf8String, fsStats) == 0 {
        let deviceName = withUnsafePointer(to: &fsStats.pointee.f_mntfromname, {
          (ptr) -> String? in
          return ptr.withMemoryRebound(to: Int8.self, capacity: Int(MNAMELEN)) {
            (str: UnsafePointer<Int8>) in
            return String(utf8String: str)
          }
        })
        
        if let device = deviceName,
          let disk = DADiskCreateFromBSDName(kCFAllocatorDefault, session, device),
          let description = DADiskCopyDescription(disk) {
          let myDict = description as NSDictionary
          let uuid = myDict[kDADiskDescriptionVolumeUUIDKey as String /* "DAVolumeUUIDD" */] as! CFUUID
          let uuidStr = CFUUIDCreateString(kCFAllocatorDefault, uuid) as String
          return UUID(uuidString: uuidStr)!
        }
      }
    }
    
    // if we didn't return earlier than we failed
    return nil
  }
  
}

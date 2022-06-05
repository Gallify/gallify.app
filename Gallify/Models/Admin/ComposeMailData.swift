//
//  ComposeMailData.swift
//  Gallify
//
//  Created by shruti on 6/5/22.
//

import Foundation

struct ComposeMailData {
  let subject: String
  let recipients: [String]?
  let message: String
  let attachments: [AttachmentData]?
}

struct AttachmentData {
  let data: Data
  let mimeType: String
  let fileName: String
}

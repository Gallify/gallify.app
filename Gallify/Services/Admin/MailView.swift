//
//  MailView.swift
//  Gallify
//
//  Created by Shruti on 6/5/22.
//

import SwiftUI

struct MailViewTest: View {
  
  var subject = ""
  var recipients = ""
  var message = ""
    
    @State private var mailData = ComposeMailData(subject: self.subject,
                                                  recipients: [self.recipients],
                                                  message: self.message,
                                                attachments: [AttachmentData(data: "Some text".data(using: .utf8)!,
                                                mimeType: "text/plain",
                                                fileName: "text.txt")
                                               ])
 @State private var showMailView = false

  var body: some View {
    Button(action: {
      showMailView.toggle()
    }) {
      Text("Send mail")
    }.disabled(!MailView.canSendMail)
    .sheet(isPresented: $showMailView) {
      MailView(data: $mailData) { result in
        print(result)
       }
    }
  }
}

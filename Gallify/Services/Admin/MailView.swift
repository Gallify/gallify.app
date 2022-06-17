//
//  MailView.swift
//  Gallify
//
//  Created by Shruti on 6/5/22.
//

import SwiftUI
import FirebaseAuth

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


struct MailViewTest: View {
    
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @State var mailData =  ComposeMailData(subject: "Your Art was Rejected :(",
                                           recipients: ["sharma224@wisc.edu"],
                        message: "Hello! We hope you are doing well! This is to inform you that after a thorough review of your art, we are sorry to inform you that we couldn't approve this it for the marketplace. Please contact us as www.gallify.app for further information.",
                      attachments: [AttachmentData(data: "Some text".data(using: .utf8)!,
                      mimeType: "text/plain",
                      fileName: "text.txt")
                     ])
    @State var showMailView = false
    
  var body: some View {
    
    Button(action: {
      showMailView.toggle()
    }) {
      Text("Send mail")
    }.disabled(MailViewController.canSendMail)
    .sheet(isPresented: $showMailView) {
      MailViewController(data: $mailData) { result in
        print(result)
       }
    }
  }
}

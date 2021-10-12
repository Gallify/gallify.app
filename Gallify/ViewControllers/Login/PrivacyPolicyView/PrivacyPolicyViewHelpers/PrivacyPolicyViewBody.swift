//
//  PrivacyPolicyViewBody.swift
//  Gallify
//
//  Created by Patron on 10/10/21.
//

import SwiftUI

struct PrivacyPolicyViewBody: View {
    
    @EnvironmentObject var viewModel: LoginAppViewModel
    
    var body: some View {
        
        let width = viewModel.screenWidth
        
        VStack(alignment: .leading) {
            
            Text("Last updated: May 23rd 2021")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.leading, width / 12)
              
            
            Text("ACCEPTANCE OF THIS PRIVACY POLICY ")
                .fontWeight(.bold)
                .padding(.vertical, width / 30)
                .padding(.leading, width / 25)
                    
                
            Text("By accessing and using our Services, you signify acceptance to the terms of this Privacy Policy. Where we require your consent to process your personal information, we will ask for your consent to the collection, use, and disclosure of your personal information as described further below. We may provide additional 'just-in-time' disclosures or information about the data processing practices of specific Services. These notices may supplement or clarify our privacy practices or may provide you with additional choices about how we process your data.")
                .padding([.leading, .bottom, .trailing], width / 25)
                
            Text("If you do not agree with or you are not comfortable with any aspect of this Privacy Policy, you should immediately discontinue access or use of our Services.")
                .padding([.leading, .bottom, .trailing], width / 25)
                
            Text("CHANGES TO THIS PRIVACY POLICY")
                .fontWeight(.bold)
                .padding(.vertical, width / 30)
                .padding(.leading, width / 25)
                
            Text("We may modify this Privacy Policy from time to time which will be indicated by changing the date at the top of this page. If we make any material changes, we will notify you by email (sent to the email address specified in your account), by means of a notice on our Services prior to the change becoming effective, or as otherwise required by law.")
                .padding(.horizontal, width / 25)
            
        }
        
    }
    
}

struct PrivacyPolicyViewBody_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyViewBody().environmentObject(LoginAppViewModel())
    }
}

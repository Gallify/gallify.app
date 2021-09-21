//
//  PrivacyPolicyView.swift
//  Gallify
//
//  Created by Shruti Sharma on 8/26/21.
//
import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        
        VStack(alignment: .leading){
                    Text("Legal")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .bottom])
                      
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Privacy Policy")
                                .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                                .padding(.leading)
                        }
                        .padding(.leading)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("User Agreement")
                                .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            
                        }
                        .padding(.horizontal)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Cookie Policy")
                                .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                                .padding(.trailing)
                                
                        }
                        
                    }
                    .padding(.bottom)
                    
                    ScrollView {
                        Text("Gallify Privacy Policy")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.trailing, 175.0)
                         
                        Text("Last updated: May 23rd 2021")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                            .padding(.trailing, 175.0)
                            .padding(.bottom)
                        Text("ACCEPTANCE OF THIS PRIVACY POLICY ")
                            .fontWeight(.bold)
                            
                        
                        Text("By accessing and using our Services, you signify acceptance to the terms of this Privacy Policy. Where we require your consent to process your personal information, we will ask for your consent to the collection, use, and disclosure of your personal information as described further below. We may provide additional 'just-in-time' disclosures or information about the data processing practices of specific Services. These notices may supplement or clarify our privacy practices or may provide you with additional choices about how we process your data.")
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("If you do not agree with or you are not comfortable with any aspect of this Privacy Policy, you should immediately discontinue access or use of our Services.")
                            .fontWeight(.semibold)
                            .padding([.leading, .bottom, .trailing])
                        
                        Text("CHANGES TO THIS PRIVACY POLICY")
                            .fontWeight(.bold)
                        
                        Text("We may modify this Privacy Policy from time to time which will be indicated by changing the date at the top of this page. If we make any material changes, we will notify you by email (sent to the email address specified in your account), by means of a notice on our Services prior to the change becoming effective, or as otherwise required by law.")
                            .padding(.horizontal)
                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Back to Top")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.862, saturation: 1.0, brightness: 1.0))
                            .multilineTextAlignment(.center)
                            .padding(.leading, 150.0)
                    }

                }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}

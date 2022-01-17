//
//  FollowButton.swift
//  Gallify
//
//  Created by Anshul on 9/14/21.
//
import SwiftUI

struct FollowButton: View {
    
    @State var isFollowing: Bool
    var buttonWidth: CGFloat
    var buttonHeight: CGFloat

    var body: some View {
        
        Button(action: {
            
            isFollowing.toggle()
            
        }) {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: buttonWidth / 8)
                    .foregroundColor(isFollowing ? .white : .pink)
                    .frame(width: buttonWidth, height: buttonHeight)
                    .overlay(isFollowing ? RoundedRectangle(cornerRadius: buttonWidth / 8).stroke(Color.gray, lineWidth: buttonWidth / 125) : RoundedRectangle(cornerRadius: buttonWidth / 8).stroke(Color.pink, lineWidth: buttonWidth / 50))
                
                Text(isFollowing ? "Following" : "Follow")
                    .font(.system(size: buttonWidth / 10, weight: .bold))
                    .foregroundColor(isFollowing ? .black : .white)
                
            }
            
        }
        
    }
    
}

struct FollowButton_Previews: PreviewProvider {
    static var previews: some View {
        FollowButton(isFollowing: true, buttonWidth: UIScreen.main.bounds.width / 3, buttonHeight: UIScreen.main.bounds.width / 12)
    }
}

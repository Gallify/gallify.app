//
//  CardContent.swift
//  Gallify
//
//  Created by Gianluca Profio on 1/2/22.
//

import SwiftUI

struct DropDownReels: View {
    
    let screenWidth: CGFloat
    
    let screenHeight: CGFloat
    
    public var body: some View {
        
        VStack {
            
            ZStack {
                
            CollectionLikedView(screenWidth: screenWidth, screenHeight: screenHeight)
                
            CollectionLikedFooter(screenWidth: screenWidth, screenHeight: screenHeight)
                .offset(y: 240)
                
                SlideOverView {
                    
                    VStack {
                        
                        CollectionReelView(screenWidth: screenWidth, screenHeight: screenHeight)
                        
                    }
                }
            }
            /* Note: This is where we'll integrate TabBarViewController. Ensure there is a solid-filled frame so it supercedes non-expanded reels*/
        }
    }

    
struct SlideOverView<Content> : View where Content : View {

    var content: () -> Content
    
    public init(content: @escaping () -> Content) {
        
        self.content = content
        
    }
     
    public var body: some View {
        
        ModifiedContent(content: self.content(), modifier: CardView())
        
    }
}


struct CardView: ViewModifier {
    
    @State private var dragging = false
    
    @GestureState private var dragTracker: CGSize = CGSize.zero
    
    @State private var position: CGFloat = UIScreen.main.bounds.height - 150
    
    
    func body(content: Content) -> some View {
        
        ZStack(alignment: .top) {
            
            ZStack(alignment: .top) {
                
                RoundedRectangle(cornerRadius: 2.5)
                    .frame(width: 150, height: 5.0)
                    .foregroundColor(Color(red: 1.0, green: 0.55, blue: 1.0, opacity: 0.6))
                
                content.padding(.top, 5)
                
            }
            .frame(minWidth: UIScreen.main.bounds.width, minHeight: UIScreen.main.bounds.height - 100)
            .scaleEffect(x: 1, y: 1, anchor: .center)
            .background(Color.white)
            .cornerRadius(15)
            
        }
        .offset(y:  max(0, position + self.dragTracker.height))
        .animation(dragging ? nil : {
            Animation.interpolatingSpring(stiffness: 250.0, damping: 40.0, initialVelocity: 5.0)
            
        }())
        .gesture(DragGesture()
                    .updating($dragTracker) { drag, state, transaction in state = drag.translation }
                    .onChanged {_ in  dragging = true }
                    .onEnded(onDragEnded))
    }
    
    
    private func onDragEnded(drag: DragGesture.Value) {
        
        dragging = false
        
        let high = UIScreen.main.bounds.height - 140
        
        let low: CGFloat = 0
        
        let dragDirection = drag.predictedEndLocation.y - drag.location.y
        
        if dragDirection > 0 {
            
            position = high
            
        }   else {
                
                position = low
            }
        }
    }
}


struct DropDownReels_Previews: PreviewProvider {
    static var previews: some View {
        DropDownReels(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height)
    }
}

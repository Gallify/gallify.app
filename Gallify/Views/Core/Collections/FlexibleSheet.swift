//
//  FlexibleSheet.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/22/22.
//

import SwiftUI

/*
 Boonked: https://www.youtube.com/watch?v=t2gFel5Bins&list=LL&index=7
 */

enum SheetMode{
    case none
    case hide
    case full
}

struct FlexibleSheet: View{ //<Content: View>
    
   // let content: () -> Content
    var sheetMode: Binding<SheetMode>
    
    init(sheetMode: Binding<SheetMode>){ //, @ViewBuilder content: @escaping () -> Content
      //  self.content = content
        self.sheetMode = sheetMode
    }
    
    private func calculateOffset() -> CGFloat {
        
        switch sheetMode.wrappedValue{
            case .none:
                return UIScreen.main.bounds.height
            case .hide:
                return UIScreen.main.bounds.height - 10
            case .full:
                return 0
        }
    }
    
    var body: some View{
        //content()
        VStack{
            Text("hello")
        }
            .offset(y: calculateOffset())
            .animation(.spring())
            .edgesIgnoringSafeArea(.all) //full screen.
    }
    
    
}

struct FlexibleSheet_Previews: PreviewProvider{
    static var previews: some View {
        FlexibleSheet(sheetMode: .constant(.none))
        
//        {
//            VStack{
//                Text("Hello")
//            }
//        }
    }
}

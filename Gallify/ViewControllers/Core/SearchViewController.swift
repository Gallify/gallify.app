//
//  SearchViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import UIKit
import SwiftUI


class SearchViewModel: ObservableObject {


}

struct SearchView : View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : SearchViewModel
    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]

        @State private var searchText = ""

        @State private var showCancelButton: Bool = false
   
    var body: some View {

 

        NavigationView {

            VStack {

                // Search view

                HStack {

                    HStack {

                        Image(systemName: "magnifyingglass")

 

                        TextField("search", text: $searchText, onEditingChanged: { isEditing in

                            self.showCancelButton = true

                        }, onCommit: {

                            print("onCommit")

                        }).foregroundColor(.primary)

 

                        Button(action: {

                            self.searchText = ""

                        }) {

                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)

                        }

                    }

                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))

                    .foregroundColor(.secondary)

                    .background(Color(.secondarySystemBackground))

                    .cornerRadius(10.0)

 

                    if showCancelButton  {

                        Button("Cancel") {

                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here

                                self.searchText = ""

                                self.showCancelButton = false

                        }

                        .foregroundColor(Color(.systemBlue))

                    }

                }

                .padding(.horizontal)

                .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly

 

                List {

                    // Filtered list of names

                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {

                        searchText in Text(searchText)

                    }

                }
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture() 

            }

        }

    }
    
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        Group {

           SearchView()

              .environment(\.colorScheme, .light)

 

            //ContentView()

              //.environment(\.colorScheme, .dark)

        }

    }

}

 

extension UIApplication {

    func endEditing(_ force: Bool) {

        self.windows

            .filter{$0.isKeyWindow}

            .first?

            .endEditing(force)

    }

}

 

struct ResignKeyboardOnDragGesture: ViewModifier {

    var gesture = DragGesture().onChanged{_ in

        UIApplication.shared.endEditing(true)

    }

    func body(content: Content) -> some View {

        content.gesture(gesture)

    }

}

 

extension View {

    func resignKeyboardOnDragGesture() -> some View {

        return modifier(ResignKeyboardOnDragGesture())

    }

}



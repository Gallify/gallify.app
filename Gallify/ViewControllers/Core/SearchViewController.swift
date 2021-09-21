//
//  SearchViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 9/18/21.
//

import UIKit
import SwiftUI
import Foundation
import AlgoliaSearchClient

//backend Algolia Connection
struct search {
    //Connecting to Algolia Application
    let client = SearchClient(appID: "D1K1VO0U2E", apiKey: "8be852153db364843d9ad4d8396fa95d")
    
    
    func searchAlgolia(searchText: String) -> String {
        let index = client.index(withName: "Gallify")
        
        let settings = Settings()
          .set(\.searchableAttributes, to: ["name"])
        index.setSettings(settings) { result in
          switch result {
          case .failure(let error):
            print("Error when applying settings: \(error)")
          case .success:
            print("Success")
          }
        }

        // Search for a first name
        var searchResultJSON: String = ""
        var query = Query(searchText)
        query.attributesToRetrieve = ["name"]
        query.hitsPerPage = 10
        
        index.search(query: query) { result in
          if case .success(let response) = result {
            searchResultJSON =  "Response: \(response)"
            print("Success search : \(response)")
          }
        }
        
        return searchResultJSON
    }
}


//various Search Related functions.
class SearchViewModel: ObservableObject {


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



//Search/Explore Screen view.
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

struct SearchViewController: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}



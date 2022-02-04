//
//  CollectionGenericNewRow.swift
//  Gallify
//
//  Created by Tejvir Mann on 2/3/22.
//

import SwiftUI

struct CollectionGenericNewRow: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @State private var users = ["Paul", "Taylor", "Adele"]
    
    var body: some View {
        
        
//        VStack{
//            Text("HIHIH")
//
//            List{
//                Text("hello")
//                Text("hello")
//                Text("hello")
//                Text("hello")
//            }
//            .listStyle(InsetListStyle())
//
//        }
//    }
    
            NavigationView {
                List {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }
                    .onDelete(perform: delete)
                }
                .toolbar {
                    EditButton()
                }
            }
        }

        func delete(at offsets: IndexSet) {
            users.remove(atOffsets: offsets)
        }
    }
    


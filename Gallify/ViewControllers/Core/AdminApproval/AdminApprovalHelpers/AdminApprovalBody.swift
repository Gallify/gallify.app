//
//  AdminApprovalBody.swift
//  Gallify
//
//  Created by Anshul on 4/1/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct AdminApprovalBody: View {
    
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    @EnvironmentObject var viewModel : TabBarViewModel
    
    @State var showDetail = false
    @State var showingSheet: Bool = false
    @State var art_popup = ""
    //@State var art = Art()
    @State var art: Art = Art()
    @State var getModelforArt = ""
    @State var scrollTo = 0
    @State var showThumbnail = true
    @State var text3Dmodel = "Load 3D Artwork"
    
    var body: some View {
        
        let screenWidth = viewModel.screenWidth
        let screenHeight = viewModel.screenHeight
       
        ScrollView {
            
            ScrollViewReader { value in
                
                if(firestoreQuery.artInReview.count > 0){ //if art in array
                    
                    ForEach(0...firestoreQuery.artInReview.count - 1, id: \.self) { i in //for all art in array.
                        
                        let artwork = firestoreQuery.artInReview[i]
                        
                        VStack {
                                
                            if(!showThumbnail && getModelforArt == artwork.artId
                                && firestoreQuery.models[i].contentLoaded && firestoreQuery.models[i] != nil) {
                                USDZPost(model: firestoreQuery.models[i])
                            }
                                
                            else {
                                        
                                WebImage(url: URL(string: artwork.thumbnailUrl))
                                .resizable()
                                .overlay(Rectangle()
                                    .frame(width: nil, height: 1, alignment: .top)
                                    .foregroundColor(Color.black), alignment: .top)
                                .scaledToFit()
                                        
                            }
                            
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("\(artwork.creator)")
                                        .font(.system(size: screenWidth / 20))
                                    
                                    Text("\(artwork.name)")
                                        .font(.system(size: screenWidth / 20))
                                    
                                }
                                .padding(.leading, screenWidth / 25)
                                
                                Spacer()
                                
                                if(artwork.forSale == true) {
                                    
                                    Text("$\(artwork.price)")
                                        .font(.system(size: screenWidth / 20, weight: .light))
                                        .padding(.trailing, screenWidth / 25)
                                    
                                }
                                
                            }
                            
                            Button {
                                
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    
                                    showDetail.toggle()
                                    art_popup = artwork.artId

                                    if(showDetail == false) {
                                        art_popup = ""
                                    }
                                    
                                }
                                
                            } label: {
                                    
                                VStack {

                                    Label("", systemImage: "chevron.down.circle")
                                        .imageScale(.large)
                                        .rotationEffect(.degrees(showDetail ? -180 : 0))
                                        .animation(.spring(), value: showDetail)
                                        .font(.system(size: screenWidth / 20))
                                        .foregroundColor(.black)
                                    
                                }
                                
                            }
                            
                            if (showDetail && artwork.artId == art_popup) {
                                    
                                AdminApprovalArtDescription(artDetails: artwork)
                                
                            }
                   
                        }
                        
                    }
                    .onChange(of: firestoreQuery.scrollTo, perform: { scroll in
                        value.scrollTo(firestoreQuery.scrollTo, anchor: .top)
                    })
//                    .onAppear(perform: {
//
//                        var i = 0
//                        for art in firestoreQuery.artworkThatsPlaying {
//
//                            if(art.artId == firestoreQuery.artThatsPlaying.artId) {
//
//                                firestoreQuery.scrollTo = i
//
//                            }
//
//                            i += 1
//
//                        }
//
//                        value.scrollTo(firestoreQuery.scrollTo, anchor: .top)
//
//                    })
                    
                }
            
            }
            
        }
 
    }
    
}

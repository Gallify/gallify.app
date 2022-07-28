//
//  OverlayView.swift
//  Reale
//
//  Created by Sahil Srivastava on 5/27/22.
//

import SwiftUI
import SDWebImageSwiftUI
import AVFoundation



//extension Image {
//    func data(url:URL) -> Self {.
//        let data = try? Data(contentsOf: url) {
//            return Image(uiImage: UIImage(data: data)!)
//                .resizable()
//        }
//    return self.resizable()
//    }
//}

struct OverlayView: View {
    
    @EnvironmentObject var arVM: ARViewModel
    @EnvironmentObject var firestoreQuery : FirestoreQuery
    
    @Binding var positionText: String
    @Binding var pauseAR: Bool
    @Binding var showAR: Bool
    @State var showAbout: Bool = false
    
    @State var disableScrollSelection: Bool = false
    @State var loadingModel: Bool = false
    @State private var hideAll: Bool = false
    @State private var showReferenceImage: Bool = false
    @State private var saveReferenceImage: Bool = false
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        VStack {
            
            
            // Header
            if(!hideAll){
                HStack {
                    // Icon - Hide
                    if loadingModel {
                        LoadingIcon()
                    } else {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: magik(27), height: magik(15))
                            .frame(width: 70, height: 70)
                            .contentShape(Rectangle())
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    //if else checks if both camera and reels screen are minimized currently.
                                     if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                                         firestoreQuery.bothScreensMinimized = true
                                     }
                                     else{
                                         firestoreQuery.bothScreensMinimized = false
                                     }

                                     firestoreQuery.showCameraScreen = false
                                     firestoreQuery.showNewScreen = false
                                     firestoreQuery.cameraPlaying = true
                                     firestoreQuery.artPlaying = false
                                     firestoreQuery.artisClicked = ""
                                    
                                     pauseAR = true
                                }
                            }
                    }
                    
                    // Spacer - Icon and Icon
                    Spacer()
                        //.frame(width: magik(38))
                    
                   
                    // Icon - Exit
                    Image("ExitIcon")
                        .resizable()
                        .frame(width: magik(25), height: magik(25))
                        .frame(width: 70, height: 70)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showAR = false
                                
                                pauseAR = true
                                
                                //also clear everything. May already be taken care of in reel view.
                                
                                //if else checks if both camera and reels screen are minimized currently.
                                if(firestoreQuery.showCameraScreen==false && firestoreQuery.showNewScreen==false){
                                    firestoreQuery.bothScreensMinimized = true
                                }
                                else{
                                    firestoreQuery.bothScreensMinimized = false
                                }
                                firestoreQuery.showCameraScreen = false
                                firestoreQuery.showNewScreen = true
                                firestoreQuery.cameraPlaying = false
                                firestoreQuery.artPlaying = true
                                
                            }
                        }
                    
                

                }
                .padding(.top, magik(30))
                .padding(.horizontal, magik(15))
                //END Header
                
                
                switch AVCaptureDevice.authorizationStatus(for: .video) {
                    case .denied, .restricted, .notDetermined:
                    
                        Text("To use the Gallify Camera, update your camera settings.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.horizontal, screenWidth / 25)
                            .padding(.vertical, screenHeight / 54)
                        
                        Button(action: {
                            
                        //    locationManager.requestPermission()
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                            
                        }, label: {
                            
                            Text("Share Camera")
                                .font(.system(size: screenWidth / 25, weight: .semibold))
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(screenWidth / 10)
                                .padding(.horizontal, screenWidth / 25)
                                .padding(.vertical, screenHeight / 54)
                            
                        })

                    case .authorized:
                        Text("")
                }
                
                
                
                //SIDEMENU:
                HStack {
                    
                    Spacer()
                    
                    VStack{
                        
                        
                    
                    //if art is in a playlist/collection, and the playlist has been saved
                    //checks if there is a playlist playing in the firstpalce.
                    if(firestoreQuery.playlistThatsPlaying.art.count > 0){
                        
                        //checks if the playlist belongs to the art that's playing. Won't always work.
                        if(firestoreQuery.playlistThatsPlaying.art[0] == firestoreQuery.artworkThatsPlaying[0].artId){
                            
                            //this should be .hasSavedGallery? but don't have this param yet.
                            //if(firestoreQuery.playlistThatsPlaying.auction){
                                // Icon - Reference Image
                                Image("chincoteague")
                                    .resizable()
                                    .frame(width: magik(30), height: magik(30))
                                    .frame(width: 70, height: 70)
                                    .contentShape(Rectangle())
                                    .foregroundColor(Color.white)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            showReferenceImage = true
                                        }
                                    }
                                    .sheet(isPresented: $showReferenceImage) {
                                            DownloadView()
                                    }
                        }
                    }
                    
                    
                    // Spacer - Icon and Icon
                    if(pauseAR){
                        Image(systemName: "play.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: magik(25), height: magik(25))
                            .frame(width: 70, height: 70)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    pauseAR.toggle()
                                }
                            }
                    }
                    else{
                        Image("PauseIcon")
                            .resizable()
                            .frame(width: magik(25), height: magik(25))
                            .frame(width: 70, height: 70)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    pauseAR.toggle()
                                }
                            }
                    }
                    
                    
                    // Spacer - Icon and Icon
                    //Spacer()
                    // Icon - Guide Enable
                    
                        
                    Image("GuideIcon")
                        .resizable()
                        .opacity(arVM.sceneUnderstanding ? 1 : 0.3)
                        .frame(width: magik(25), height: magik(25))
                        .frame(width: 70, height: 70)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.spring()) {
                                arVM.sceneUnderstanding.toggle()
                            }
                        }
                    
                    // Spacer - Icon and Icon
                    //Spacer()
                        
                    // Icon - About
                    Image(systemName: "questionmark")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: magik(15), height: magik(25))
                        .frame(width: 70, height: 70)
                        .contentShape(Rectangle())
                        
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showAbout = true
                                
                            }
                        }
                        .alert(isPresented: $showAbout) {
                            Alert(title: Text("Tips!"), message: Text("Move your device around so it can track your space. Double Tap Art to Delete. Also, saving coming soon!"), dismissButton: .default(Text("Cancel")))
                        }
                    }
                                            
                }
                
              //  .padding(.top, magik(60))
                .padding(.horizontal, magik(15))
                
            //END of SIDEMENU
            
                
            // Spacer - Header and Footer
            Spacer()
                
            // Footer
                ZStack(alignment: .bottom) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ScrollViewReader { sProxy in
                            HStack {
                                Spacer()
                                    .frame(width: magik(159))
                                ForEach(arVM.models, id: \.name) { model in
                                    GeometryReader { proxy in
                                        let posX = proxy.frame(in: .global).origin.x + magik(64) / 2
                                        let selected = abs(posX - UIScreen.main.bounds.width / 2) < 40
                                        
                                        WebImage(url: URL(string: model.art.thumbnailUrl))
                                            .resizable()
                                            .frame(width: selected ? magik(64) : magik(42), height: selected ? magik(64) : magik(42))
                                            .clipShape(RoundedRectangle(cornerRadius: magik(30)))
                                            .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
                                            .animation(.spring())
                                            .onChange(of: selected, perform: { newValue in
    //                                                print(newValue, model.name)
                                            })
                                            .id(model.name)
                                            .onTapGesture {
                                                if arVM.selectedModel != model {
                                                    // Disable scroll selection to avoid overlapping animation
                                                    disableScrollSelection = true
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                                        disableScrollSelection = false
                                                    }
                                                    withAnimation(.easeInOut(duration: 0.25)) {
                                                        sProxy.scrollTo(model.name, anchor: .center)
                                                    }
                                                    arVM.select(model: model)
                                                    loadingModel = true
        
                                                    //get model async first.
                                                    
                                                    //load model
                                                    model.loadEntity { _ in
                                                        loadingModel = false
                                                    }
                                                    
                                                } else if arVM.selectedModel == model && selected {
                                                    arVM.place(model: arVM.selectedModel!)
                                                }
                                            }
                                    }
                                    .frame(width: magik(64), height: magik(64))
                                    
                                    Spacer()
                                        .frame(width: magik(12))
                                }
                                Spacer()
                                    .frame(width: magik(159))
                            }
                        }
                    }
                    if positionText != "" {
                        Text("\(positionText)")
                            .font(.custom("Avenir Next", fixedSize: magik(14)))
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0, green: 0, blue: 0))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: magik(8))
                                .fill(Color(red: 1, green: 1, blue: 1)))
                            .padding(.bottom, magik(80))
                            .onAppear() {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    positionText = ""
                                }
                            }
                    }
                }
                .padding(.bottom, magik(30))
                .edgesIgnoringSafeArea(.all)
                .onChange(of: firestoreQuery.showCameraScreen, perform: { newValue in
                    if newValue == true {
                        // Load models
                        arVM.loadModels(models: firestoreQuery.fetchModelData())
                    }
                })
            }
            
            
            
            
            if(hideAll){
                Spacer()
            }
            
            Button(action: {
                //if clicked, hides other buttons
                hideAll.toggle()
                }) {
                    
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 25))
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50)
                        .contentShape(Rectangle())
                        
                        
            }
            .offset(y:-30)
        }
    }
}

//
//  AROverlayView.swift
//  Gallify
//
//  Created by Sahil Srivastava on 6/17/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct AROverlayView: View {
    
    @StateObject var arVM = ARViewModel()
    
    @EnvironmentObject var firestoreQuery: FirestoreQuery
    
    @State var disableScrollSelection: Bool = false
    
    var body: some View {
        ZStack {
            ARDisplayView()
                .environmentObject(arVM)
            VStack {
                // Header
                HStack {
                    // Icon - Exit
                    Image("DropDownIcon")
                        .resizable()
                        .frame(width: adaptiv(26), height: adaptiv(14))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                firestoreQuery.showCameraScreen = false
                            }
                        }
                    // Spacer - Icon and Icon
                    Spacer()
                }
                .padding(.top, adaptiv(84))
                .padding(.horizontal, adaptiv(52))
                // Spacer - Header and Footer
                Spacer()
                // Footer
                ZStack(alignment: .bottom) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        ScrollViewReader { sProxy in
                            HStack {
                                Spacer()
                                    .frame(width: adaptiv(159))
                                ForEach(arVM.models, id: \.art.id) { model in
                                    GeometryReader { proxy in
                                        let posX = proxy.frame(in: .global).origin.x + adaptiv(64) / 2
                                        let selected = abs(posX - UIScreen.main.bounds.width / 2) < 40

                                        WebImage(url: URL(string: model.art.thumbnailUrl))
                                            .resizable()
                                            .frame(width: selected ? adaptiv(64) : adaptiv(42), height: selected ? adaptiv(64) : adaptiv(42))
                                            .clipShape(RoundedRectangle(cornerRadius: adaptiv(30)))
                                            .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
                                            .animation(.spring())
                                            .onChange(of: selected, perform: { newValue in
    //                                                print(newValue, model.name)
                                            })
                                            .id(model.art.id)
                                            .onTapGesture {
                                                if arVM.selectedModel != model {
                                                    // Disable scroll selection to avoid overlapping animation
                                                    disableScrollSelection = true
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                                        disableScrollSelection = false
                                                    }
                                                    withAnimation(.easeInOut(duration: 0.25)) {
                                                        sProxy.scrollTo(model.art.id, anchor: .center)
                                                    }
                                                    model.asyncLoadModelEntity { completed, error in
                                                        if completed {
                                                            //select model for placement
                                                            model.contentLoaded = true
                                                            model.isLoading = false
                                                            arVM.select(model: model)
                                                            
                                                            print("SELECTED \(model.art.storageName)")
                                                        } else {
                                                            print(error?.localizedDescription)
                                                        }
                                                    }
                                                } else if arVM.selectedModel == model && selected {
                                                    print("PLACING \(model.art.storageName)")
                                                    arVM.place(model: arVM.selectedModel!)
                                                }
                                            }
                                    }
                                    .frame(width: adaptiv(64), height: adaptiv(64))

                                    Spacer()
                                        .frame(width: adaptiv(12))
                                }
                                Spacer()
                                    .frame(width: adaptiv(159))
                            }
                        }
                    }
                }
                .padding(.bottom, adaptiv(80))
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onChange(of: firestoreQuery.showCameraScreen, perform: { newValue in
            if newValue == true {
                // Load models
                arVM.loadModels(models: firestoreQuery.fetchModelData())
            }
        })
    }
    
//    var body: some View {
//        ZStack {
//            ARDisplayView()
//                .environmentObject(arVM)
//            VStack {
//                Image("DropDownIcon")
//                    .resizable()
//                    .frame(width: 26, height: 14)
//                    .padding(.top, 70)
//                    .padding(.leading, 36)
//                Spacer()
//                VStack(spacing: 45) {
//                    ZStack {
//                        HStack(spacing: 20) {
//                            ForEach(arVM.models, id: \.art.id) { model in
//                                WebImage(url: URL(string: model.art.thumbnailUrl))
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 33, height: 33)
//                                    .background(Color(UIColor.secondarySystemFill))
//                                    .clipped()
//                                    .clipShape(Circle())
//                            }
//                        }
//                        HStack(spacing: 6) {
//                            Image("CameraTapLeftIcon")
//                                .resizable()
//                                .frame(width: 16, height: 42)
//                            Image("CameraTapIcon")
//                                .resizable()
//                                .frame(width: 70, height: 70)
//                            Image("CameraTapRightIcon")
//                                .resizable()
//                                .frame(width: 16, height: 42)
//                        }
//                    }
//                    Image("XIcon")
//                        .resizable()
//                        .frame(width: 27, height: 27)
//                }
//                .padding(.bottom, 47)
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//        .onChange(of: firestoreQuery.showCameraScreen, perform: { newValue in
//            if newValue == true {
//                // Load models
//                arVM.loadModels(models: firestoreQuery.fetchModelData())
//            }
//        })
//    }
}

extension View {
    func adaptiv(_ val: CGFloat) -> CGFloat {
        return val
    }
}

//
//  HomeViewController.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/18/21.
//

import UIKit
import SwiftUI

class HomeViewModel: ObservableObject {

}

struct HomeView : View {
    @State var email = ""
    @State var password = ""
    
    let SettingsImageName = "gear"
    
    @EnvironmentObject var viewModel : HomeViewModel
        var body: some View {
            
            
            VStack {
                
                HStack {
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(.leading)
                    
                    Text("Gallify")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                        .offset(x: -15)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus.square")
                            .resizable()
                            .foregroundColor(Color.black)
                            .padding(/*@START_MENU_TOKEN@*/.all, 7.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 50.0, height: 50.0)
                        })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "waveform.path.ecg")
                            .resizable()
                            .foregroundColor(Color.black)
                            .padding(.all, 7.0)
                            .frame(width: 50, height: 50)
                            .padding(.trailing)
                    })
                }
                .padding(.bottom, -3)
                
                Divider()
                
                ScrollView(showsIndicators: false) {
                    
                    VStack{
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                VStack {
                                    
                                    CircleImage(image: Image("turtlerock"), length: 90, breadth: 90, color: .purple)
                                        .padding(5.0)
                                    
                                    Text("LoggedUser")
                                        .foregroundColor(Color.gray)
                                        .offset(y: -5)
                                }
                                .padding(.leading)
                                
                                VStack {
                                    
                                    CircleImage(image: Image("twinlake"), length: 90, breadth: 90, color: .white)
                                        .padding(5.0)
                                    
                                    Text("Artist1")
                                        .foregroundColor(Color.gray)
                                        .offset(y: -5)
                                }
                                
                                VStack {
                                    
                                    CircleImage(image: Image("icybay"), length: 90, breadth: 90, color: .white)
                                        .padding(5.0)
                                    
                                    Text("Artist2")
                                        .foregroundColor(Color.gray)
                                        .offset(y: -5)
                                }
                                
                                VStack {
                                    
                                    CircleImage(image: Image("chincoteague"), length: 90, breadth: 90, color: .white)
                                        .padding(5.0)
                                    
                                    Text("Artist3")
                                        .foregroundColor(Color.gray)
                                        .offset(y: -5)
                                }
                                
                                VStack {
                                    
                                    CircleImage(image: Image("umbagog"), length: 90, breadth: 90, color: .white)
                                        .padding(5.0)
                                    
                                    Text("Artist4")
                                        .foregroundColor(Color.gray)
                                        .offset(y: -5)
                                }
                                .padding(.trailing)
                            }
                        }
                        
                        HStack {
                            
                            Text("Good evening!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(15.0)
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            
                            Text("Your Portfolio")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
                            Spacer()
                            
                        }
                        
                        HStack {
                            
                            Text("Recent")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading])
                            
                            Spacer()
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack{
                                
                                VStack() {
                                        
                                    ZStack {
                                                
                                        Image(systemName: "squareshape.fill")
                                            .resizable()
                                            .foregroundColor(Color.pink)
                                            .frame(width:100, height:100)
                                            .padding()
                                            .background(Color.pink)
                                            .cornerRadius(20)
                                                
                                        Image(systemName: "suit.heart.fill")
                                            .resizable()
                                            .foregroundColor(Color.white)
                                            .frame(width: 70, height: 70)
                                                
                                    }
                                    .padding(.leading)
                                            
                                    Text("Liked")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.leading)
                                        
                                }
                                
                                VStack() {
                                    
                                    ZStack {
                                        
                                        Image(systemName: "squareshape.fill")
                                            .resizable()
                                            .foregroundColor(Color.yellow)
                                            .frame(width:100, height:100)
                                            .padding()
                                            .background(Color.yellow)
                                            .cornerRadius(20)
                                            .padding(.leading)
                                        
                                        VStack {
                                            
                                            Text("Friends")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Text("Feed")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                        }
                                        .padding(.leading)
                                            
                                    }
                                    
                                    Text("Friends Feed")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.leading)
                                    
                                }
                                
                                VStack() {
                                    
                                    Image("lakemcdonald")
                                        .resizable()
                                        .frame(width: 132, height: 132)
                                        .cornerRadius(20)
                                    
                                    Text("Lakes")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        
                                }
                                .padding(.leading)
                                
                                VStack() {
                                    
                                    Image("charleyrivers")
                                        .resizable()
                                        .frame(width: 132, height: 132)
                                        .cornerRadius(20)
                                        .padding(.leading)
                                    
                                    Text("Surreal")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.leading)
                                }
                                
                                VStack() {
                                    
                                    ZStack {
                                        
                                        Image(systemName: "squareshape.fill")
                                            .resizable()
                                            .foregroundColor(Color.black)
                                            .frame(width:100, height:100)
                                            .padding()
                                            .background(Color.black)
                                            .cornerRadius(20)
                                            .padding(.leading)
                                        
                                        VStack {
                                            
                                            Text("New Local")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                            Text("Artists")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                        }
                                        .padding(.leading)
                                            
                                    }
                                    
                                    Text("Local Artists")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.leading)
                                    
                                }
                                .padding(.trailing)
                                
                            }
                            
                        }
                    
                        HStack {
                            
                            Text("Discover")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading])
                            
                            Spacer()
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                VStack() {
                                    
                                    ZStack {
                                        
                                        Image(systemName: "squareshape.fill")
                                            .resizable()
                                            .foregroundColor(Color.black)
                                            .frame(width:100, height:100)
                                            .padding()
                                            .background(Color.black)
                                            .cornerRadius(20)
                                            .padding(.leading)
                                        
                                        VStack {
                                            
                                            Text("New Local")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                            Text("Artists")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                        }
                                        .padding(.leading)
                                            
                                    }
                                    
                                    Text("Local Artists")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.leading)
                                    
                                }
                                
                                VStack() {
                                    
                                    ZStack {
                                        
                                        Image(systemName: "squareshape.fill")
                                            .resizable()
                                            .foregroundColor(Color.black)
                                            .frame(width:100, height:100)
                                            .padding(.all)
                                            .background(Color.black)
                                            .cornerRadius(20)
                                            .padding(.leading)
                                        
                                        Image(systemName: "arrow.up.circle.fill")
                                            .resizable()
                                            .foregroundColor(Color.blue)
                                            .frame(width: 70, height: 70)
                                            .padding()
                                            .padding(.leading)
                                        
                                    }
                                    
                                    Text("Top Collectors")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.leading)
                                    
                                }
                                
                                VStack() {
                                    
                                    ZStack {
                                        
                                        Image(systemName: "squareshape.fill")
                                            .resizable()
                                            .foregroundColor(Color.black)
                                            .frame(width:100, height:100)
                                            .padding(.all)
                                            .background(Color.black)
                                            .cornerRadius(20)
                                            .padding(.leading)
                                        
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .foregroundColor(Color.orange)
                                            .frame(width: 70, height: 70)
                                            .padding()
                                            .padding(.leading)
                                        
                                    }
                                    
                                    Text("Popular Artists")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.leading)
                                    
                                }
                                .padding(.trailing)
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    VStack {
                
                        HStack {
                            
                            Text("Made for you")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading])
                            
                            Spacer()
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false)
                        {
                            
                            HStack {
                                
                                VStack() {
                                    
                                    ZStack {
                                        
                                        Image(systemName: "squareshape.fill")
                                            .resizable()
                                            .foregroundColor(Color.black)
                                            .frame(width:100, height:100)
                                            .padding(.all)
                                            .background(Color.black)
                                            .cornerRadius(20)
                                            .padding(.leading)
                                        
                                        Image(systemName: "flame.fill")
                                            .resizable()
                                            .foregroundColor(Color.yellow)
                                            .frame(width: 70, height: 70)
                                            .padding()
                                            .padding(.leading)
                                        
                                    }
                                    
                                    Text("Hottest Art")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.leading)
                                    
                                }
                                
                                VStack() {
                                    
                                    Image("silversalmoncreek")
                                        .resizable()
                                        .frame(width: 132, height: 132)
                                        .cornerRadius(20)
                                    
                                    Text("Mountains")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        
                                }
                                .padding(.leading)
                                
                                VStack() {
                                    
                                    Image("hiddenlake")
                                        .resizable()
                                        .frame(width: 132, height: 132)
                                        .cornerRadius(20)
                                    
                                    Text("Snowy Areas")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        
                                }
                                .padding(.horizontal)
                                
                                
                            }
                            
                        }
                        
                        HStack {
                            
                            Text("Auctions")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding([.top, .leading])
                                
                            Spacer()
                            
                        }
                        
                        ZStack {
                            
                            Image(systemName: "squareshape.fill")
                                .resizable()
                                .foregroundColor(Color.red)
                                .frame(width: 250, height: 250)
                                .cornerRadius(50)
                            
                            VStack {
                                
                                HStack {
                                    
                                    Image(systemName: "hammer.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "banknote.fill")
                                        .resizable()
                                        .foregroundColor(Color.green)
                                        .frame(width: 50, height: 30)
                                    
                                }
                                
                                Text("Auctions")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                
                            }
                                
                        }
                    }
                }
            }
    }
}

// Remove preview after done coding home screen
struct HomeScreenPreview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

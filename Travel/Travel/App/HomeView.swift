//
//  ContentView.swift
//  Travel
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    var screen = UIScreen.main.bounds
    
    // ヒーローアニメーション用
    var animation: Namespace.ID
    
    @Binding var show: Bool
    @Binding var selected: Location
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView (showsIndicators: false) {
                VStack {
                    
                    // MARK: - Top Bar
                    HStack {
                        Text("Let's Travel")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image("search")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        }) //: Button
                    } //: HStack
                    .padding()
                    
                    // MARK: - Category Scroll
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 15) {
                            ForEach(0..<7) { i in
                                Image("r\(i + 1)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 6, y: 6)
                            } //: ForEach
                        } //: HStack
                        .padding()
                    } //: Scroll
                    
                    // MARK: - Title
                    HStack {
                        Text("Destinations")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Spacer()
                        Button(action: {}, label: {
                            Text("See All")
                                .foregroundColor(.white)
                        })
                    } //: HStack
                    .padding()
                    
                    // MARK: - Locations
                    VStack (spacing: 30) {
                        ForEach(locationData) { location in
                            ZStack (alignment: .bottomLeading) {
                                Image(location.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: screen.width - 50, height: 300)
                                    .cornerRadius(25)
                                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 0)
                                    // ヒーローアニメーション用
                                    .matchedGeometryEffect(id: location.image, in: animation)
                                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                                    .frame(width: screen.width - 50, height: 140)
                                    .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight], size: CGSize(width: 25, height: 25)))
                                VStack (alignment: .leading, spacing: 6) {
                                    Text(location.prefecture)
                                        .font(.system(size: 18))
                                        // ヒーローアニメーション用
                                        .matchedGeometryEffect(id: location.id, in: animation)
                                    Text(location.title)
                                        .font(.system(size: 24))
                                        // ヒーローアニメーション用
                                        .matchedGeometryEffect(id: location.title, in: animation)
                                } //: VStack
                                .foregroundColor(.white)
                                .padding(12)
                            } //: ZStack
                            
                            // MARK: - Tap Location
                            .onTapGesture(perform: {
                                // animationをつけないとヒーローアニメーションできない
                                withAnimation(.spring()) {
                                    selected = location
                                    show = true
                                }
                            })
                        } //: ForEach
                    } //: VStack
                } //: VStack
            } //: Scroll
        } //: ZStack
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


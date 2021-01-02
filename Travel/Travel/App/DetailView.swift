//
//  MainView.swift
//  Travel
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Property
    
    var screen = UIScreen.main.bounds
    var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    @Binding var selected: Location
    @Binding var show: Bool
    
    // ヒーローアニメーション用
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .top) {
            
            // MARK: - Background
            LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Color.black.opacity(0.3)
//                .ignoresSafeArea()
                .frame(width: screen.width, height: 420)
                .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight], size: CGSize(width: 45, height: 45)))
            
            VStack (alignment: .leading) {
                ZStack (alignment: .top) {
                    
                    // MARK: - Location Image
                    Image(selected.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: screen.width, height: 300)
                        .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight], size: CGSize(width: 45, height: 45)))
                        // ヒーローアニメーション用 ※ idが一致するプロパティ同士を結びつけてヒーローアニメーションさせる
                        .matchedGeometryEffect(id: selected.image, in: animation)
                    
                    // MARK: - Top Button
                    HStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                show = false
                            }
                        }, label: {
                            Image(systemName: "chevron.left")
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                )
                        }) //: Button
                        .frame(width: 45, height: 45)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image("search")
                                .padding()
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                )
                        }) //: Button
                        .frame(width: 45, height: 45)
                    } //: HStack
                    .padding(.top, edge!.top == 0 ? 15 : edge?.top)
                    .padding(.horizontal, 10)
                    
                } //: ZStack
                
                // MARK: - Location Info
                HStack {
                    VStack (alignment: .leading) {
                        Text(selected.title)
                            .font(.system(size: 24))
                            .matchedGeometryEffect(id: selected.title, in: animation)
                        HStack {
                            Image("map")
                                .renderingMode(.template)
                                .foregroundColor(.white)
                            Text(selected.prefecture)
                                .padding(.trailing, 14)
                                .font(.system(size: 18))
                                .matchedGeometryEffect(id: selected.id, in: animation)
                            HStack (spacing: 2) {
                                ForEach(0..<selected.ratings) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 14))
                                } //: ForEach
                            } //: HStack
                        } //: HStack
                    } //: VStack
                    Spacer()
                } //: HStack
                .padding(.horizontal, 12)
                .padding(.top, 10)
                
                // MARK: - Title
                VStack (alignment: .leading, spacing: 14) {
                    Text("Title")
                        .font(.largeTitle)
                    Text("text text text text text text text text text text text text text text")
                    Text("text text text text text text text text text text text text text text text text text text text text text text text text text text text text text")
                } //: VStack
                .padding(.horizontal, 12)
                .padding(.top, 38)
                
                // MARK: - Horizontal Button
                HStack (spacing: 16) {
                    ForEach(0..<5) { i in
                        CircleButton(index: i + 1)
                    }
                } //: HStack
                .padding(.horizontal, 12)
                .padding(.top, 20)
                
                // MARK: - Bottom
                VStack (spacing: 26) {
                    Text("text text text text text text text text text text text text text text text text text text text text text text text text text text text text text")
                    Button(action: {}, label: {
                        Text("Add to Favorites")
                            .padding()
                            .padding(.horizontal, 10)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color("Color2"), Color("Color1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
                            )
                    }) //: Button
                } //: VStack
                .padding(.horizontal, 12)
                .padding(.top, 14)
                    
                Spacer()
            } //: VStack
            .foregroundColor(.white)
        } //: ZStack
        .ignoresSafeArea()
    }
}

// MARK: - Preview

struct DetailView_Previews: PreviewProvider {
    
    @Namespace static var animation
    
    @State static var show = false
    @State static var selected : Location = locationData[2]
    
    static var previews: some View {
        DetailView(selected: $selected, show: $show, animation: animation)
    }
}


// MARK: - Helper Struct

struct CircleButton: View {
    
    // MARK: - Property
    
    var index: Int
    
    
    // MARK: - Body
    
    var body: some View {
        Button(action: {}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("Color2"), Color("Color1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 45, height: 45)
                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 4, y: 4)
                Text("\(index)")
            } //: ZStack
        })
    }
}

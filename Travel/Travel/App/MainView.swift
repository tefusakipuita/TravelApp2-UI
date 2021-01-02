//
//  MainView.swift
//  Travel
//
//  Created by 中筋淳朗 on 2020/11/13.
//



// hero animation の作り方

// 1. MainView に遷移元と遷移先を ZStackで繋げる (showで切り替え)
// 2. 親となる MainView に『@Namespace var animation』,
//      アニメーションさせる両画面に『var animation: Namespace.ID』
// 3. hero animation させたい各プロパティに『.matchedGeometryEffect(id: location.image, in: animation)』
//      idが一致するプロパティ同士が結びついて hero animation する
// 4. showの切り替え時に animation をつける (easeOut でも spring でもなんでもいい)





import SwiftUI

struct MainView: View {
    
    // MARK: - Property
    
    // ヒーローアニメーション用
    @Namespace var animation
    
    @State var show = false
    @State var selected : Location = locationData[0]
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            HomeView(animation: animation, show: $show, selected: $selected)
            
            if show {
                DetailView(selected: $selected, show: $show, animation: animation)
            } //: if
        } //: ZStack
    }
}

// MARK: - Preview

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

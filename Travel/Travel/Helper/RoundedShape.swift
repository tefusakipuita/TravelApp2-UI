//
//  RoundedShape.swift
//  Travel
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import SwiftUI


struct RoundedShape: Shape {
    
    var corners: UIRectCorner
    var size: CGSize
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: size)
        
        return Path(path.cgPath)
    }
}

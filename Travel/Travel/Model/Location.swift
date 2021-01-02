//
//  Location.swift
//  Travel
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import Foundation


struct Location: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var prefecture: String
    var ratings: Int
    var image: String
}

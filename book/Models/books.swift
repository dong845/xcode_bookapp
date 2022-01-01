//
//  books.swift
//  book
//
//  Created by 吕东杭 on 2022/1/1.
//

import Foundation

class Books: Identifiable, Decodable{
    var id:Int
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var content:[String]
}

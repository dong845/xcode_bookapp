//
//  book_model.swift
//  book
//
//  Created by 吕东杭 on 2022/1/1.
//

import Foundation

class BookModel:ObservableObject{
    @Published var books = [Books]()
    
    init(){
        let paths = Bundle.main.path(forResource: "Data", ofType: "json")
        if paths != nil {
            let url = URL(fileURLWithPath: paths!)
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                do{
                    let book_data = try decoder.decode([Books].self, from: data)
                    self.books = book_data
                }catch{
                    print(error)
                    print("Errors Happened!")
                }
            }catch{
                print(error)
                print("Errors Happened!")
            }
            
        }
    }
    
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
//            print(index)
//            print(books[index].isFavourite)
//            books[index].isFavourite = !books[index].isFavourite
//            print(books[index].isFavourite)
            books[index].isFavourite.toggle()
        }
    }
    
    func updateRating(forId: Int, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    func updatePage(forId:Int, page:Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = page
        }
    }
}

//
//  BookContent.swift
//  book
//
//  Created by 吕东杭 on 2022/1/1.
//

import SwiftUI

struct BookContent: View {
    @EnvironmentObject var book_mod:BookModel
    @State private var page = 0
    var book:Books
    
    var body: some View {
        TabView(selection: $page){
            ForEach(0..<book.content.count, id:\.self){
                index in
                VStack(spacing:15){
                    Text(book.content[index]).tag(index)
                    Text("\(page+1)")
                }
            }
        }.padding()        .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .onChange(of: page, perform: {value in book_mod.updatePage(forId:book.id, page:page)})
            .onAppear {page = book.currentPage}
    }
}

struct BookContent_Previews: PreviewProvider {
    static var previews: some View {
        var bookm = BookModel()
        var book1 = bookm.books[0]
        BookContent(book: book1).environmentObject(BookModel())
    }
}

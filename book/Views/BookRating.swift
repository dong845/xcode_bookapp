//
//  BookRating.swift
//  book
//
//  Created by 吕东杭 on 2022/1/1.
//

import SwiftUI

struct BookRating: View {
    @EnvironmentObject var book_mod:BookModel
    @State private var rating = 2
    var book:Books
    
    var body: some View {
        VStack(spacing:20){
            NavigationLink(destination:BookContent(book:book)){
                VStack(spacing:15){
                    Text("Read Now!").font(.title).foregroundColor(.black)
                    Image("cover\(book.id)").resizable().scaledToFit()
                }.padding()
            }
            
            VStack(spacing:15){
                Text("Mark for later!").bold()
                Button(action: { book_mod.updateFavourite(forId: book.id) }) {
                    Image(systemName: book.isFavourite ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .accentColor(.yellow)
            }
            
            VStack(spacing:15){
                Text("Rate Text and More").bold()
                Picker("Rate", selection: $rating){
                    ForEach(1..<6){
                        index in
                        Text(String(index)).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle()).frame(width:300).cornerRadius(15).onChange(of: rating, perform: {value in book_mod.updateRating(forId: book.id, rating: rating)})
            }
            
            
        }
        .onAppear { rating = book.rating }
        .navigationBarTitle("\(book.title)")
    }
}

struct BookRating_Previews: PreviewProvider {
    static var previews: some View {
        var bookm = BookModel()
        var book1 = bookm.books[0]
        BookRating(book:book1).environmentObject(BookModel())
    }
}

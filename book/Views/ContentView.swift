//
//  ContentView.swift
//  book
//
//  Created by 吕东杭 on 2022/1/1.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var book_mod:BookModel
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(spacing:20){
                    ForEach(book_mod.books){
                        book in NavigationLink(destination:BookRating(book: book)){
                            ZStack(alignment:.leading){
                                Rectangle().foregroundColor(.white).frame(height: 600, alignment: .leading).cornerRadius(15).shadow(color: .black, radius: 10, x: -5, y: 5)

                                VStack(alignment:.leading, spacing: 15){
                                    HStack{
                                        Text(book.title).font(.title).bold().foregroundColor(.black)

                                        Spacer()

                                        if book.isFavourite {
                                            Image(systemName: "star.fill").resizable().frame(width: 28, height: 28).foregroundColor(.yellow)
                                        }
                                    }

                                    Text(book.author).font(.headline).foregroundColor(.black)

                                    Image("cover\(book.id)").resizable().scaledToFit()

                                }.padding()
                            }.padding()
                        }
                    }
                }
            }.navigationBarTitle("My Library")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(BookModel())
    }
}

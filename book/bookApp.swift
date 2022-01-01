//
//  bookApp.swift
//  book
//
//  Created by 吕东杭 on 2022/1/1.
//

import SwiftUI

@main
struct bookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(BookModel())
        }
    }
}

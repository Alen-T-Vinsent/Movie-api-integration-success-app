//
//  _3_4_netflix_movie_appApp.swift
//  13.4 netflix movie app
//
//  Created by Apple  on 14/12/22.
//

import SwiftUI

@main
struct _3_4_netflix_movie_appApp: App {
    @StateObject var store = MovieStore()
    var body: some Scene {
        WindowGroup {
            ContentView(store1:store)
        }
    }
}

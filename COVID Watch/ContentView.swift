//
//  ContentView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 10/31/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var covidData = CovidData()
    @StateObject var newsData = NewsData()
    
    @AppStorage("favoriteState") var favoriteState = "ME"
    
    var body: some View {
        TabBarView(covidData: covidData, newsData: newsData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let screen = UIScreen.main.bounds

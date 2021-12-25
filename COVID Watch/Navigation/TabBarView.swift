//
//  TabView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/3/20.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var covidData: CovidData
    @ObservedObject var newsData: NewsData

    @AppStorage("favoriteState") var favoriteState = "ME"
    
    var body: some View {
        TabView {
            NavigationView { 
//                CustomHomeScrollView(width: screen.width, height: screen.height, state: returnStateApiKey(for: favoriteState), covidData: covidData, newsData: newsData)
                HomeView(newsData: newsData)
            }
            .tabItem {
                Image(systemName: "house.fill")
            }
            
            NavigationView {
                AllStatesView(covidData: covidData)
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
            }
            
            NavigationView {
                WorldView()
                
            }
            .tabItem {
                Image(systemName: "globe")
            }
        }
        .accentColor(.white)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(covidData: CovidData(), newsData: NewsData())
    }
}

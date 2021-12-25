//
//  AllStatesView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/3/20.
//

import SwiftUI

struct AllStatesView: View {
    @ObservedObject var covidData: CovidData
    
    @AppStorage("favoriteState") var favoriteState = "ME"

    
    var body: some View {
        List(allStringStates, id: \.self) { state in
            NavigationLink(
                destination:  CustomStateScrollView(width: screen.width, height: screen.height, state: returnStateApiKey(for: state), covidData: covidData, newsData: NewsData(), isCountry: false)) {
                    Text(returnStateName(state: returnStateApiKey(for: state)))
                        .foregroundColor(favoriteState == state ? Color.yellow : Color("Text"))
            }
        }
       
        .listStyle(GroupedListStyle())
        .navigationBarTitle("All States")
    }
}

struct AllStatesView_Previews: PreviewProvider {
    static var previews: some View {
        AllStatesView(covidData: CovidData())
    }
}

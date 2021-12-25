//
//  WorldView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/3/20.
//

import SwiftUI

struct WorldView: View {
    @StateObject var covidData = CovidData()
    
    var body: some View {
        CustomStateScrollView(width: screen.width, height: screen.height, state: .Country, covidData: covidData, newsData: NewsData(), isCountry: true)
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}

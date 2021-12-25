//
//  TabView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/3/20.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        Tab {
            HomeView()
                .tabItem {
                    Image(systemName: "home.fill")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

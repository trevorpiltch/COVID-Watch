//
//  COVID_WatchApp.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 10/31/20.
//

import SwiftUI
import Combine

@main
struct COVID_WatchApp: App {
    init() {
        // Changing the font of the navigation bar title
        let design = UIFontDescriptor.SystemDesign.rounded
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
            .withDesign(design)!
        let font = UIFont.init(descriptor: descriptor, size: 48)
        
        // Changing the navigation bar apperance
        let navigationBarAppearance = UINavigationBarAppearance()
        let tabBarAppearance = UITabBarAppearance()
        
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(named: "Green")
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(.white)]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().tintColor = UIColor(.white)
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : font]
        UINavigationBar.appearance().titleTextAttributes = [.font : font]
        
        // Changing the tab bar appearence
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(named: "Green")
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}

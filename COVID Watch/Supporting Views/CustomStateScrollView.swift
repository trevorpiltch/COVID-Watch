//
//  CustomScrollView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/15/20.
//

import SwiftUI
import UIKit
import Combine

struct CustomStateScrollView : UIViewRepresentable {
    var width : CGFloat
    var height : CGFloat
    var state: state
    var covidData: CovidData
    var newsData: NewsData
    var isCountry: Bool

    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, state: state, covidData: covidData, newsData: newsData, isCountry: isCountry)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action:
                                            #selector(Coordinator.handleRefreshControl),
                                          for: .valueChanged)
        let childView = UIHostingController(rootView: StateView(covidData: covidData, isCountry: isCountry, selectedState: state))
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        control.addSubview(childView.view)
        return control
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
    class Coordinator: NSObject {
        var control: CustomStateScrollView
        var state : state
        var covidData: CovidData
        var newsData: NewsData
        var isCountry: Bool
        
        init(_ control: CustomStateScrollView, state: state, covidData: CovidData, newsData: NewsData, isCountry: Bool) {
            self.control = control
            self.state = state
            self.covidData = covidData
            self.newsData = newsData
            self.isCountry = isCountry
        }
      
        @objc func handleRefreshControl(sender: UIRefreshControl) {
            sender.endRefreshing()
            Api().getNews(state: state) { (data) in
                self.newsData.fields = data
            }
            Api().getCovidData(country: isCountry, state: state) { (data) in
                self.covidData.fields = data
            }
        }
    }
}

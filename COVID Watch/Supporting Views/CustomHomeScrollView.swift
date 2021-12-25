//
//  CustomHomeScrollView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/15/20.
//

import SwiftUI
import Combine

struct CustomHomeScrollView : UIViewRepresentable {
    var width : CGFloat
    var height : CGFloat
    var state: state
    var covidData: CovidData
    var newsData: NewsData

    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, state: state, covidData: covidData, newsData: newsData)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action:
                                            #selector(Coordinator.handleRefreshControl),
                                          for: .valueChanged)
        let childView = UIHostingController(rootView: HomeView(newsData: newsData))
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        control.addSubview(childView.view)
        return control
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
    
    class Coordinator: NSObject {
        var control: CustomHomeScrollView
        var state : state
        var covidData: CovidData
        var newsData: NewsData
        
        init(_ control: CustomHomeScrollView, state: state, covidData: CovidData, newsData: NewsData) {
            self.control = control
            self.state = state
            self.covidData = covidData
            self.newsData = newsData
        }
        
        @objc func handleRefreshControl(sender: UIRefreshControl) {
            sender.endRefreshing()
            Api().getNews(state: state) { (data) in
                self.newsData.fields = data
            }
            Api().getCovidData(country: false, state: state) { (data) in
                self.covidData.fields = data
            }
        }
    }
}


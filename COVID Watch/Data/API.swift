//
//  API.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/8/20.
//

import SwiftUI
import Combine

class Api {
    // Get the data from the https://covidtracking.com for the selected state
    func getCovidData(country: Bool, state: state, completion: @escaping ([CovidAPIFields]) -> ()) {
        var url = URL(string: "")
        if country {
            print("Country")
            url = URL(string: "https://api.covidtracking.com/v1/us/current.json")
        }
        else {
            url = URL(string: "https://covidtracking.com/api/v1/states/\(stateAPIKey(state: state))/daily.json")
        }
        
        print("COVID API Called")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {
                print("Data Error")

                return
            }
            
            let fieldData = try! JSONDecoder().decode([CovidAPIFields].self, from: data)
            
            DispatchQueue.main.async {
                completion(fieldData)
            }
        }
        .resume()
    }
    
    // Get covid related news from http://newsapi.org
    func getNews(state: state, completion: @escaping (NewsAPIFields) -> ()) {
        print("News Data API Called")
        let url = URL(string: "http://newsapi.org/v2/everything?q=COVID&apiKey=784ec9f593f24785b2e2c5cc3e070a4b")

        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {
                print("Data Error")

                return
            }

            let fieldData = try! JSONDecoder().decode(NewsAPIFields.self, from: data)
            
//            print("Total results: \(fieldData.totalResults)")

            DispatchQueue.main.async {
                completion(fieldData)
            }
        }
        .resume()
    }
}

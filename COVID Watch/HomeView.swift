//
//  HomeView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/3/20.
//

import SwiftUI
import Combine

struct HomeView: View {
//    @ObservedObject var covidData: CovidData
    @ObservedObject var newsData: NewsData
    
    @StateObject var covidData = CovidData()
    
    @AppStorage("favoriteState") var favoriteState = "ME"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
//            StateView(covidData: covidData, isCountry: true, selectedState: returnStateApiKey(for: favoriteState))
            CustomStateScrollView(width: screen.width, height: screen.height, state: returnStateApiKey(for: favoriteState), covidData: covidData, newsData: newsData, isCountry: false)
                .frame(height: screen.height)
            
            Text("Latest COVID-19 News")
                .font(.system(.title2, design: .rounded))
            
            ForEach(0..<5) { i in
                Link(destination: URL(string: newsData.fields?.articles[i]?.url ?? "www.apple.com")!) {
                    ZStack {
                        ImageViewContainer(remoteImageURL: (newsData.fields?.articles[i]?.urlToImage) ?? "sample")
                        
                        VStack {
                            Spacer()
                            
                            Text(newsData.fields?.articles[i]?.title! ?? "Example News Title")
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .frame(width: screen.width - 32, height: 70)
                                .background(VisualEffectBlur(blurStyle: .systemMaterial))
                        }
                    }
                    .frame(width: screen.width - 32, height: 207)
                    .cornerRadius(15)
                    .padding(.vertical, 10)
                    .foregroundColor(Color("Text"))
                }
            }
            
            
            VStack {
                Spacer()
                
                Image("flower-4")
                    .resizable()
                    .scaleEffect(0.5)
                
                Text("Looking at depressing news can have adverse effects on your mental health. Try getting outside and enjoy some nature. Stay safe!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .offset(y: -50)
                
                VStack(spacing: 5) {
                    Text("Covid data provided by the COVID Tracking Project.")
                    Text("News provided by NewsAPI")
                    Text("Created with love by Trevor")
                        .foregroundColor(.red)
                }
                .multilineTextAlignment(.center)
                .font(.caption)
                .opacity(0.7)
            }
            .padding(.bottom, 250)
        }
    
        .frame(maxHeight: .infinity)
        .onAppear {
            Api().getNews(state: returnStateApiKey(for: favoriteState)) { (data) in
                newsData.fields = data
            }
           
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(newsData: NewsData())
    }
}

struct ImageViewContainer: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(remoteImageURL: String) {
        self.remoteImageURL = RemoteImageURL(imageURL: remoteImageURL)
    }
    
    var body: some View {
        Image(uiImage: ((remoteImageURL.data.isEmpty) ? UIImage(imageLiteralResourceName: "Sample") : UIImage(data: remoteImageURL.data))!)
            .resizable()
    }
}

class RemoteImageURL: ObservableObject {
    @Published var data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}

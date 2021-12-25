//
//  StateView.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/8/20.
//

import SwiftUI

struct StateView: View {
    @ObservedObject var covidData: CovidData
    
    @AppStorage("favoriteState") var favoriteState = "ME"
    
    var isCountry: Bool
    
    var selectedState: state
    
    var body: some View {
        VStack {
            VStack {  
                VStack(alignment: .trailing) {
                    HStack {
                        Text("Cases")
                        
                        Spacer()
                        
                        Text("\(self.covidData.fields[0].positive!)")
                    }
                    
                    Text("+ \(self.covidData.fields[0].positiveIncrease!)")
                        .opacity(0.7)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                
                VStack(alignment: .trailing) {
                    HStack {
                        Text("Deaths")
                        
                        Spacer()
                        
                        Text("\(self.covidData.fields[0].death!)")
                    }
                    
                    Text("+ \(self.covidData.fields[0].deathIncrease!)")
                        .opacity(0.7)
                }
                .padding(.horizontal, 16)
//                .padding(.vertical, 16)
                
                Spacer()
            }
            .font(.system(.title, design: .rounded))
            .frame(maxWidth: .infinity)
            .frame(height: screen.height / 4)
            .background(RoundedCorners(color: Color("Green"), tl: 0, tr: 0, bl: 60, br: 0))
            .foregroundColor(.white)
            .navigationBarTitle(returnStateName(state: selectedState))
            .navigationBarItems(trailing:
                                    VStack {
                                        if selectedState != .Country {
                                            Image(systemName: selectedState == returnStateApiKey(for: favoriteState) ? "star.fill" : "star")
                                                .foregroundColor(.yellow)
                                                .onTapGesture {
                                                    favoriteState = "\(selectedState)".uppercased()
                                                }
                                        }
                                    }
            )
            
            HStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color("Green"))
                    
                    Text("")
                        .frame(width: 60, height: 60)
                        .background(RoundedCorners(color: Color("Rounded Square"), tl: 0, tr: 60, bl: 0, br: 0))
                }
            }

            LineGraphView(covidData: covidData, state: selectedState)
                .disabled(true)
            
            if selectedState == .Country {
                Text("Graph may take longer than anticipated to appear (organizing data).")
                    .font(.caption)
                    .padding(.top, 16)
                    .opacity(0.8)
            }
            
            Spacer()
        }
        .onAppear {
            Api().getCovidData(country: isCountry, state: selectedState) { (data) in
                covidData.fields = data
            }
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(covidData: CovidData(), isCountry: false, selectedState: .ME)
    }
}

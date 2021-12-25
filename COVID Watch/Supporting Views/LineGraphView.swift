//
//  LineGraphView.swift
//  COVID Tracker
//
//  Created by Trevor Piltch on 6/15/20.
//  Copyright © 2020 Trevor Piltch. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct LineGraphView: View {
    @ObservedObject var covidData: CovidData
    
    @State var reversedField = [covidTestData]
    @State var cases: [Double] = []
    @State var update = true
    
    var state: state
    
    var body: some View {
        LineView(data: self.cases, style: chartStyle)
            .frame(width: screen.width - 32, height: screen.height / 4)
            .padding(.leading, 5)
            .padding(.bottom, 20)
            .frame(width: screen.width - 32, height: screen.height / 3)
            .onAppear {
                if self.covidData.fields.count == 1 {
                    self.update = false
                }
                self.updateGraph()
            }
            .onReceive(self.covidData.objectWillChange) {
                if self.covidData.fields.count == 1 {
                    self.update = false
                }
                else {
                    self.update = true
                }
                self.updateGraph()
            }
    }
    
    func updateGraph() {
        if self.update {
            self.reversedField = self.covidData.fields.reversed()
            self.cases.removeAll()
            
            var average: Double = 0
            
            for i in 7..<self.reversedField.count {
                average = 0
                for t in (i-7)..<i {
                    average += Double(self.reversedField[t].positiveIncrease!)
                }
                average /= 7
                
                self.cases.append(average)
            }
        }
    }
}

struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView(covidData: CovidData(), state: .ME)
    }
}

let chartStyle = ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColor(start: Color("Green"), end: Color("Green")), textColor: Color.blue, legendTextColor: Color.black, dropShadowColor: Color.white)

let darkChartStyle = ChartStyle(backgroundColor: Color("Background"), accentColor: Color("Main Text"), gradientColor: GradientColor(start: Color("Green 2"), end: Color("Green 1")), textColor: Color("Main Text"), legendTextColor: Color("Background"), dropShadowColor: Color("Background"))



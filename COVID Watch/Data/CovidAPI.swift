//
//  APIField.swift
//  COVID Tracker
//
//  Created by Trevor Piltch on 11/8/20.
//  Copyright © 2020 Trevor Piltch. All rights reserved.
//

import SwiftUI
import Combine

// Data type for the data from the API
struct CovidAPIFields: Codable {
    var checkTimeEt: String?
    var commercialScore: Int?
    var dataQualityGrade: String?
    var date: Int?
    var dateChecked: String?
    var dateModified: String?
    var death: Int?
    var deathIncrease: Int?
    var fips: String?
    var grade: String?
    var hash: String?
    var hospitalized: Int?
    var hospitalizedCumulative: Int?
    var hospitalizedCurrently: Int?
    var hospitalizedIncrease: Int?
    var inIcuCumulative: Int?
    var inIcuCurrently: Int?
    var lastUpdateEt: String?
    var negative: Int?
    var negativeIncrease: Int?
    var negativeRegularScore: Int?
    var negativeScore: Int?
    var negativeTestsViral: Int?
    var onVentilatorCumulative: Int?
    var onVentilatorCurrently: Int?
    var pending: Int?
    var postNeg: Int?
    var positive: Int?
    var positiveCasesViral: Int?
    var positiveIncrease: Int?
    var positiveScore: Int?
    var positiveTestsViral: Int?
    var recovered: Int?
    var score: Int?
    var state: String?
    var total: Int?
    var totalTestResults: Int?
    var totalTestResultsIncrease: Int?
    var totalTestsViral: Int?
}

// Struct to have it update when something changes
class CovidData: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var fields: [CovidAPIFields] = [covidTestData] {
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        
    }
    
    init(fields: [CovidAPIFields]) {
        self.fields = fields
    }
}

// Sample Field Data
let covidTestData = CovidAPIFields(checkTimeEt: "", commercialScore: 0, dataQualityGrade: "", date: 2, dateChecked: "", dateModified: "", death: 0, deathIncrease: 0, fips: "", grade: "", hash: "", hospitalized: 0, hospitalizedCumulative: 0, hospitalizedCurrently: 0, hospitalizedIncrease: 0, inIcuCumulative: 0, inIcuCurrently: 0, lastUpdateEt: "", negative: 0, negativeIncrease: 0, negativeRegularScore: 0, negativeScore: 0, negativeTestsViral: 0, onVentilatorCumulative: 0, onVentilatorCurrently: 0, pending: 0, postNeg: 0, positive: 0, positiveCasesViral: 0, positiveIncrease: 0, positiveScore: 0, positiveTestsViral: 0, recovered: 0, score: 0, state: "ME", total: 0, totalTestResults: 0, totalTestResultsIncrease: 0, totalTestsViral: 0)

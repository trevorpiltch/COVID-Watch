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
struct APIFieldData: Codable {
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
class APIFieldChange: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var fields: [APIFieldData]? = nil {
        didSet {
            objectWillChange.send()
        }
    }
}


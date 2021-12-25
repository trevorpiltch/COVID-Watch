//
//  GraphType.swift
//  COVID-19 Tracker
//
//  Created by Trevor Piltch on 7/2/20.
//

import SwiftUI
import Combine

// Type to have the graph switch between cases and deaths
class GraphType: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var graphType = "Cases" {
        didSet {
            objectWillChange.send()
        }
    }
}

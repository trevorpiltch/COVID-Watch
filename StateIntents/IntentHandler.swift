//
//  IntentHandler.swift
//  StateIntents
//
//  Created by Trevor Piltch on 11/23/20.
//

import Intents
import SwiftUI

class IntentHandler: INExtension, SelectStateIntentHandling  {
    func resolveState(for intent: SelectStateIntent, with completion: @escaping (WidgetStateResolutionResult) -> Void) {}
    
    func provideStateOptionsCollection(for intent: SelectStateIntent, with completion: @escaping (INObjectCollection<WidgetState>?, Error?) -> Void) {
        let selectedStates: [WidgetState] = StateDetail.availableStates.map { stateDetail in
            let state = WidgetState(identifier: stateDetail.state, display: returnStateName(state: stateDetail))
            state.name = stateDetail.state
        
            return state
        }
        let collection = INObjectCollection(items: selectedStates)
        completion(collection, nil)
    }
    
    override func handler(for intent: INIntent) -> Any {
        return self
    }
}

struct StateDetail {
    let state: String
    
    static let availableStates = [
        StateDetail(state: "AL"),
        StateDetail(state: "AK"),
        StateDetail(state: "AZ"),
        StateDetail(state: "AR"),
        StateDetail(state: "CA"),
        StateDetail(state: "CO"),
        StateDetail(state: "CT"),
        StateDetail(state: "DE"),
        StateDetail(state: "DC"),
        StateDetail(state: "FL"),
        StateDetail(state: "GA"),
        StateDetail(state: "HI"),
        StateDetail(state: "ID"),
        StateDetail(state: "IL"),
        StateDetail(state: "IN"),
        StateDetail(state: "IA"),
        StateDetail(state: "KS"),
        StateDetail(state: "KY"),
        StateDetail(state: "LA"),
        StateDetail(state: "ME"),
        StateDetail(state: "MD"),
        StateDetail(state: "MA"),
        StateDetail(state: "MI"),
        StateDetail(state: "MN"),
        StateDetail(state: "MS"),
        StateDetail(state: "MO"),
        StateDetail(state: "MT"),
        StateDetail(state: "NE"),
        StateDetail(state: "NV"),
        StateDetail(state: "NH"),
        StateDetail(state: "NJ"),
        StateDetail(state: "NM"),
        StateDetail(state: "NY"),
        StateDetail(state: "NC"),
        StateDetail(state: "ND"),
        StateDetail(state: "OH"),
        StateDetail(state: "OK"),
        StateDetail(state: "OR"),
        StateDetail(state: "PA"),
        StateDetail(state: "RI"),
        StateDetail(state: "SC"),
        StateDetail(state: "SD"),
        StateDetail(state: "TN"),
        StateDetail(state: "TX"),
        StateDetail(state: "UT"),
        StateDetail(state: "VT"),
        StateDetail(state: "VA"),
        StateDetail(state: "WA"),
        StateDetail(state: "WV"),
        StateDetail(state: "WI"),
        StateDetail(state: "WY")
    ]
}

func returnStateName(state: StateDetail) -> String {
    switch state.state {
    case "AL":
        return "Alabama"
    case "AK":
        return "Alaska"
    case "AZ":
        return "Arizona"
    case "AR":
        return "Arkansas"
    case "CA":
        return "California"
    case "CO":
        return "Colorado"
    case "CT":
        return "Connecticut"
    case "DE":
        return "Delaware"
    case "DC":
        return "Dist. of Columbia"
    case "FL":
        return "Florida"
    case "GA":
        return "Georgia"
    case "HI":
        return "Hawaii"
    case "ID":
        return "Idaho"
    case "IL":
        return "Illinois"
    case "IN":
        return "Indiana"
    case "IA":
        return "Iowa"
    case "KS":
        return "Kansas"
    case "KY":
        return "Kentucky"
    case "LA":
        return "Louisiana"
    case "ME":
        return "Maine"
    case "MD":
        return "Maryland"
    case "MA":
        return "Massachusetts"
    case "MI":
        return "Michigan"
    case "MN":
        return "Minnesota"
    case "MS":
        return "Mississippi"
    case "MO":
        return "Missouri"
    case "MT":
        return "Montana"
    case "NE":
        return "Nebraska"
    case "NV":
        return "Nevada"
    case "NH":
        return "New Hampshire"
    case "NJ":
        return "New Jersey"
    case "NM":
        return "New Mexico"
    case "NY":
        return "New York"
    case "NC":
        return "North Carolina"
    case "ND":
        return "North Dakota"
    case "OH":
        return "Ohio"
    case "OK":
        return "Oklahoma"
    case "OR":
        return "Oregon"
    case "PA":
        return "Pennsylvania"
    case "RI":
        return "Rhode Island"
    case "SC":
        return "South Carolina"
    case "SD":
        return "South Dakota"
    case "TN":
        return "Tennessee"
    case "TX":
        return "Texas"
    case "UT":
        return "Utah"
    case "VT":
        return "Vermont"
    case "VA":
        return "Virginia"
    case "WA":
        return "Washington"
    case "WV":
        return "West Virginia"
    case "WI":
        return "Wisconsin"
    case "WY":
        return "Wyoming"

    default:
        return ""
    }
}

//
//  State.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/3/20.
//

import SwiftUI

enum state {
    case AL
    case AK
    case AZ
    case AR
    case CA
    case CO
    case CT
    case DE
    case DC
    case FL
    case GA
    case HI
    case ID
    case IL
    case IN
    case IA
    case KS
    case KY
    case LA
    case ME
    case MD
    case MA
    case MI
    case MN
    case MS
    case MO
    case MT
    case NE
    case NV
    case NH
    case NJ
    case NM
    case NY
    case NC
    case ND
    case OH
    case OK
    case OR
    case PA
    case RI
    case SC
    case SD
    case TN
    case TX
    case UT
    case VT
    case VA
    case WA
    case WV
    case WI
    case WY
    case Country
}

let allStringStates = ["AL",
 "AK",
 "AZ",
 "AR",
 "CA",
 "CO",
 "CT",
 "DE",
 "DC",
 "FL",
 "GA",
 "HI",
 "ID",
 "IL",
 "IN",
 "IA",
 "KS",
 "KY",
 "LA",
 "ME",
 "MD",
 "MA",
 "MI",
 "MN",
 "MS",
 "MO",
 "MT",
 "NE",
 "NV",
 "NH",
 "NJ",
 "NM",
 "NY",
 "NC",
 "ND",
 "OH",
 "OK",
 "OR",
 "PA",
 "RI",
 "SC",
 "SD",
 "TN",
 "TX",
  "UT",
  "VT",
  "VA",
  "WA",
  "WV",
  "WI",
"WY"]

// Returns the full state name
func returnStateName(state: state) -> String {
    switch state {
    case .AL:
        return "Alabama"
    case .AK:
        return "Alaska"
    case .AZ:
        return "Arizona"
    case .AR:
        return "Arkansas"
    case .CA:
        return "California"
    case .CO:
        return "Colorado"
    case .CT:
        return "Connecticut"
    case .DE:
        return "Delaware"
    case .DC:
        return "Dist. of Columbia"
    case .FL:
        return "Florida"
    case .GA:
        return "Georgia"
    case .HI:
        return "Hawaii"
    case .ID:
        return "Idaho"
    case .IL:
        return "Illinois"
    case .IN:
        return "Indiana"
    case .IA:
        return "Iowa"
    case .KS:
        return "Kansas"
    case .KY:
        return "Kentucky"
    case .LA:
        return "Louisiana"
    case .ME:
        return "Maine"
    case .MD:
        return "Maryland"
    case .MA:
        return "Massachusetts"
    case .MI:
        return "Michigan"
    case .MN:
        return "Minnesota"
    case .MS:
        return "Mississippi"
    case .MO:
        return "Missouri"
    case .MT:
        return "Montana"
    case .NE:
        return "Nebraska"
    case .NV:
        return "Nevada"
    case .NH:
        return "New Hampshire"
    case .NJ:
        return "New Jersey"
    case .NM:
        return "New Mexico"
    case .NY:
        return "New York"
    case .NC:
        return "North Carolina"
    case .ND:
        return "North Dakota"
    case .OH:
        return "Ohio"
    case .OK:
        return "Oklahoma"
    case .OR:
        return "Oregon"
    case .PA:
        return "Pennsylvania"
    case .RI:
        return "Rhode Island"
    case .SC:
        return "South Carolina"
    case .SD:
        return "South Dakota"
    case .TN:
        return "Tennessee"
    case .TX:
        return "Texas"
    case .UT:
        return "Utah"
    case .VT:
        return "Vermont"
    case .VA:
        return "Virginia"
    case .WA:
        return "Washington"
    case .WV:
        return "West Virginia"
    case .WI:
        return "Wisconsin"
    case .WY:
        return "Wyoming"
    case .Country:
        return "United States"
    }
}

// Returns the lowercase string of the state for the API call
func returnStateApiKey(for state: String) -> state {
    switch state {
    case "AL":
        return .AL
    case "AK":
        return .AK
    case "AZ":
        return .AZ
    case "AR":
        return .AR
    case "CA":
        return .CA
    case "CO":
        return .CO
    case "CT":
        return .CT
    case "DE":
        return .DE
    case "DC":
        return .DC
    case "FL":
        return .FL
    case "GA":
        return .GA
    case "HI":
        return .HI
    case "ID":
        return .ID
    case "IL":
        return .IL
    case "IN":
        return .IN
    case "IA":
        return .IA
    case "KS":
        return .KS
    case "KY":
        return .KY
    case "LA":
        return .LA
    case "ME":
        return .ME
    case "MD":
        return .MD
    case "MA":
        return .MA
    case "MI":
        return .MI
    case "MN":
        return .MN
    case "MS":
        return .MS
    case "MO":
        return .MO
    case "MT":
        return .MT
    case "NE":
        return .NE
    case "NV":
        return .NV
    case "NH":
        return .NH
    case "NJ":
        return .NJ
    case "NM":
        return .NM
    case "NY":
        return .NY
    case "NC":
        return .NC
    case "ND":
        return .ND
    case "OH":
        return .OH
    case "OK":
        return .OK
    case "OR":
        return .OR
    case "PA":
        return .PA
    case "RI":
        return .RI
    case "SC":
        return .SC
    case "SD":
        return .SD
    case "TN":
        return .TN
    case "TX":
        return .TX
    case "UT":
        return .UT
    case "VT":
        return .VT
    case "VA":
        return .VA
    case "WA":
        return .WA
    case "WV":
        return .WV
    case "WI":
        return .WI
    case "WY":
        return .WY
    default:
        return .ME
    }
}

func stateAPIKey(state: state) -> String {
    return "\(state)".lowercased()
}

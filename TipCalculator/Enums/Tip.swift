//
//  Tip.swift
//  TipCalculator
//
//  Created by Akhmadullin, Shamil on 19/12/2023.
//

import Foundation

enum Tip {
    case none
    case tenPercent
    case fiftenPercent
    case twentyPercent
    case custom(value: Int)
    
    var stringValue: String {
        switch self {
        case .none:
            ""
        case .tenPercent:
            "10%"
        case .fiftenPercent:
            "15%"
        case .twentyPercent:
            "20%"
        case .custom(value: let value):
            String(value)
        }
    }
}

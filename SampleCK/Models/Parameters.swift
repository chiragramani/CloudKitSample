//
//  Parameters.swift
//  SampleCK
//
//  Created by Chirag Ramani on 11/09/22.
//

import Foundation

// MARK: ParameterType

enum ParameterType {
    case string(value: String)
    case int(value: Int)
}

// MARK: Parameter

struct Parameter {
    let name: String
    let type: ParameterType
    
    // Mostly for holding CKRecord info to see all the values returned by
    // CloudKit for debugging purposed.
    let metadata: String
}

// MARK: ParameterType: CustomDebugStringConvertible

extension ParameterType: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .int(let value):
            return "\(value)(Int)"
        case .string(let value):
            return "\(value)(String)"
        }
    }
}

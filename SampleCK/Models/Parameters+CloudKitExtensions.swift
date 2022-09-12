//
//  Parameters+CloudKitExtensions.swift
//  SampleCK
//
//  Created by Chirag Ramani on 11/09/22.
//

import Foundation
import CloudKit

// MARK: CKRecord Custom Init

extension Parameter {
    private enum RecordType: String {
        case string
        case int
    }
    
    init?(
        record: CKRecord
    ) {
        // Probably more validating taking recordZones, lastMetadataChanges zone info,
        // versioning to filter out what records are really required.
        guard let paramName = record.value(forKey: "name") as? String,
              let paramType = record.value(forKey: "type") as? String,
              let paramValue = record.value(forKey: "value") as? String,
              let recordType = Parameter.RecordType(rawValue: paramType) else {
            return nil
        }
        switch recordType {
        case .string:
            self.init(name: paramName,
                      type: .string(value: paramValue),
                      metadata: record.debugDescription)
        case .int:
            if let intValue = Int(paramValue) {
                self.init(name: paramName,
                          type: .int(value: intValue),
                          metadata: record.debugDescription)
            } else {
                return nil
            }
        }
    }
}

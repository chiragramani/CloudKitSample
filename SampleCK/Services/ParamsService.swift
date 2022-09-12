//
//  XPCloudKitService.swift
//  SampleCK
//
//  Created by Chirag Ramani on 11/09/22.
//

import Foundation
import CloudKit

final class ParamsService {
    func fetchParameters() async throws -> [Parameter] {
        let query = CKQuery(
            recordType: "FeatureFlag",
            predicate: NSPredicate(value: true)
        )
        let publicDatabase = CKContainer.default().publicCloudDatabase
        let records = try await publicDatabase.records(
            matching: query,
            inZoneWith: nil)
        return records.compactMap{ Parameter(record: $0) }
    }
}

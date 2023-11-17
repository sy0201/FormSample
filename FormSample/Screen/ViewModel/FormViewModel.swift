//
//  FormViewModel.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/15.
//

import Foundation

final class FormViewModel {

    var writeFormDataList: [String: [WriteFormModel]] = [:]

    func getLocations() -> [String] {
        var locationKey: [String] = []
        for (key, _) in writeFormDataList {
            locationKey.append(key)
        }
        return locationKey
    }

    func getTotalCount() -> Int {
        var totalCount = 0
        for (_, value) in writeFormDataList {
            totalCount += value.count
        }
        return totalCount
    }
}

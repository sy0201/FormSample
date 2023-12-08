//
//  FormViewModel.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/15.
//

import Foundation

final class FormViewModel {

    var title = WriteFormModel()
    var writeFormDataList: [String: [WriteFormModel]] = [:]
    var selectedLocationIndex: Int?
    var locationKeys: [String] = []

    func getLocations() {
        locationKeys = []
        for (key, _) in writeFormDataList {
            locationKeys.append(key)
        }
    }

    func getDefectiveData() -> [WriteFormModel] {
        var dic: [String: WriteFormModel] = ["Swift": WriteFormModel(), "Xcode": WriteFormModel()]
        var defectiveDataArray: [WriteFormModel] = []

        for (_, writeFormModel) in dic {
            let defectiveDataValue = writeFormModel.defectiveData
            print("defectiveData: \(defectiveDataValue)")

            // 가져온 defectiveData 값을 배열에 추가
            defectiveDataArray.append(writeFormModel)
        }

        return defectiveDataArray
    }


    func getWriteFormModels(forKey key: String) -> [WriteFormModel]? {
        return writeFormDataList[key]
    }

    func getTotalCount() -> Int {
        var totalCount = 0
        for (_, value) in writeFormDataList {
            totalCount += value.count
        }
        return totalCount
    }
}

//
//  FormViewModel.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/15.
//

import Foundation

class Section {
    var title: String
    var options = [WriteFormModel]()
    var isOpened = false

    init(title: String, options: [WriteFormModel], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

final class FormViewModel {

    var writeFormDataList: [String: [WriteFormModel]] = [:]
    var isOpened: Bool = false

    init() {
        writeFormDataList["거실"] = [
            WriteFormModel(locationData: "거실",
                           defectiveData: "선택 안함1",
                           photoDataListDataType: PhotoModelDataType(zoomInImage: nil, zoomOutImage: nil, isOptional: false),
                           contentData: "내용",
                           isActive: false),
            WriteFormModel(locationData: "거실",
                           defectiveData: "선택 안함2",
                           photoDataListDataType: PhotoModelDataType(zoomInImage: nil, zoomOutImage: nil, isOptional: false),
                           contentData: "내용",
                           isActive: false),
            WriteFormModel(locationData: "거실",
                           defectiveData: "선택 안함3",
                           photoDataListDataType: PhotoModelDataType(zoomInImage: nil, zoomOutImage: nil, isOptional: false),
                           contentData: "내용",
                           isActive: false)]
    }


    func getLocations() -> [String] {
        var locationKey: [String] = []
        for (key, _) in writeFormDataList {
            locationKey.append(key)
        }
        return locationKey
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

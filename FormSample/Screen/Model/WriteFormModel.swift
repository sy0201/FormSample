//
//  FormModel.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/10/11.
//

import UIKit

struct WriteFormModel {
    
    var locationData = ""
    var defectiveData = ""
    var photoDataListDataType = PhotoModelDataType()
    var contentData = ""
}

struct PhotoModelDataType {
    var zoomInImage: UIImage?
    var zoomOutImage: UIImage?
    var isOptional: Bool = false
}


// MARK: - JSON Model
struct LocationModel: Codable {
    let locationName: String
}

struct DefectiveItemModel: Codable {
    let defectiveItem: String
}

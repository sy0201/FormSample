//
//  FormViewModel.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/10/11.
//

import Foundation

final class WriteFormViewModel {

    var writeFormModel = WriteFormModel()

    var locationModel: [LocationModel] = []
    var defectiveItemModel: [DefectiveItemModel] = []
}

extension WriteFormViewModel {
    func fetchLocationData(completion: @escaping () -> ()) {
        NetworkingManager.shared.getLocationMock { [weak self] data in
            self?.locationModel = data
            completion()
        }
    }

    func fetchDefectiveData(completion: @escaping () -> ()) {
        NetworkingManager.shared.getDefectiveMock { [weak self] data in
            self?.defectiveItemModel = data
            completion()
        }
    }
}

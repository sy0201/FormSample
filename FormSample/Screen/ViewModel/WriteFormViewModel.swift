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
        NetworkingManager.shared.getLocationMock(completionHandler: { [weak self] data in
            guard let data else { return }
            self?.locationModel = data
            completion()
        })
    }

    func fetchDefectiveData(completion: @escaping () -> ()) {
        NetworkingManager.shared.getDefectiveMock(completionHandler: { [weak self] data in
            guard let data else { return }
            self?.defectiveItemModel = data
            completion()
        })
    }
}

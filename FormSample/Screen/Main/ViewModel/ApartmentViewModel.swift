//
//  ApartmentViewModel.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/17.
//

import Foundation

final class ApartmentViewModel {

    var apartmentNameDataList: [ApartmentModel] = []

    func fetchApartmentData(completion: @escaping () -> ()) {
        NetworkingManager.shared.getApartmentMock { [weak self] data in
            self?.apartmentNameDataList = data
            completion()
        }
    }
}

//
//  NetworkingManager.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/09.
//

import Foundation

class NetworkingManager {

    static let shared = NetworkingManager()
    
    private init() {}

    func getApartmentMock(completionHandler: @escaping([ApartmentModel]) -> Void) {
        if let path = Bundle.main.path(forResource: "ApartmentList", ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([ApartmentModel].self, from: data)
                completionHandler(model)
            } catch {
                Console.error("Error decoding JSON: \(error)")
            }
        }
    }

    func getLocationMock(completionHandler: @escaping([LocationModel]) -> Void) {
        if let path = Bundle.main.path(forResource: "Location", ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {

            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([LocationModel].self, from: data)
                Console.debug("DEBUG: Decoded model count - \(model.count)")
                completionHandler(model)
            } catch {
                Console.error("Error decoding JSON: \(error)")
            }
        }
    }

    func getDefectiveMock(completionHandler: @escaping([DefectiveItemModel]) -> Void) {
        if let path = Bundle.main.path(forResource: "Defective", ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {

            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([DefectiveItemModel].self, from: data)
                Console.debug("DEBUG: Decoded model count - \(model.count)")
                completionHandler(model)
            } catch {
                Console.error("Error decoding JSON: \(error)")
            }
        }
    }
}

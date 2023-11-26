//
//  DefectiveBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/26.
//

import UIKit

final class DefectiveBottomViewController: UIViewController {

    let defectiveSelectionBaseView = DefectiveSelectionBaseView()
    private let defectiveViewModel = WriteFormViewModel()

    override func loadView() {
        view = defectiveSelectionBaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getDefectiveData()
    }
    
    private func setupCollectionView() {
        defectiveSelectionBaseView.setupTableView()
    }
}

extension DefectiveBottomViewController {
    func getDefectiveData() {
        defectiveViewModel.fetchDefectiveData {
            self.defectiveSelectionBaseView.defectiveDataList = self.defectiveViewModel.defectiveItemModel.map({ $0.defectiveItem })
        }
    }
}

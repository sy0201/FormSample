//
//  DefectiveBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/26.
//

import UIKit

final class DefectiveBottomViewController: BaseViewController {

    let selectDefectiveBaseView = SelectDefectiveBaseView()
    var defectiveHandler: (String) -> Void = { _ in }

    override func loadView() {
        view = selectDefectiveBaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectDefectiveBaseView.delegate = self
        selectDefectiveBaseView.setupTableView()
        setupTargetButton()
    }
}

extension DefectiveBottomViewController {
    func setupTargetButton() {
        selectDefectiveBaseView.dismissButton.addTarget(self, action: #selector(dismissBottomView), for: .touchUpInside)
    }

    @objc func dismissBottomView() {
        back(animated: true)
    }
}

extension DefectiveBottomViewController: SelectRadioCellDelegate {
    func didSelectItem(_ item: String) {
        defectiveHandler(item)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            self.back(animated: true)
        }
    }
}

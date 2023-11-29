//
//  SelectApartmentViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/19.
//

import UIKit

final class SelectApartmentBottomViewController: BaseViewController {

    let selectApartmentBottomView = SelectApartmentBottomView()
    var apartmentNameHandler: (String) -> Void = { _ in }

    override func loadView() {
        view = selectApartmentBottomView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        selectApartmentBottomView.delegate = self
        selectApartmentBottomView.setupTableView()
        setupButtonTapped()
    }
}

extension SelectApartmentBottomViewController {
    func setupButtonTapped() {
        selectApartmentBottomView.closeBottomButton.addTarget(self, action: #selector(closeBottomView), for: .touchUpInside)
    }

    @objc func closeBottomView() {
        back(animated: true)
    }
}

extension SelectApartmentBottomViewController: SelectRadioCellDelegate {
    func didSelectItem(_ item: String) {
        apartmentNameHandler(item)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            self.back(animated: true)
        }
    }
}

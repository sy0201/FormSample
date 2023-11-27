//
//  PresentFloorViewController.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/10/17.
//

import UIKit

final class PresentFloorViewController: BaseViewController {

    let presentFloorBaseView = FloorBaseView()

    override func loadView() {
        view = presentFloorBaseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonTapped()
    }
}

extension PresentFloorViewController {
    func setupButtonTapped() {
        presentFloorBaseView.dismissButton.addTarget(self, action: #selector(dismissBottomView), for: .touchUpInside)
    }

    @objc func dismissBottomView() {
        back(animated: true)
    }
}

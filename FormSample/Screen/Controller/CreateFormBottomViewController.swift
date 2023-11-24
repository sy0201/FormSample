//
//  CreateFormBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit

final class CreateFormBottomViewController: UIViewController {

    let createFormBaseView = CreateFormBaseView()

    override func loadView() {
        view = createFormBaseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargetButton()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.createFormBaseView.defectiveTextView.resignFirstResponder()
    }
}

extension CreateFormBottomViewController {
    func setupTargetButton() {
        createFormBaseView.unSelectedButton.addTarget(self, action: #selector(hiddenPhotoView), for: .touchUpInside)
    }

    @objc func hiddenPhotoView() {
        print("선택안함")
    }
}

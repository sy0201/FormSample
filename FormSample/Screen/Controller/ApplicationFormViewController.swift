//
//  ApplicationFormViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/21.
//

import UIKit

final class ApplicationFormViewController: BaseViewController {

    let applicationFormView = ApplicationFormBaseView()
    
    override func loadView() {
        view = applicationFormView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonTapped()
    }

    func setupButtonTapped() {
        applicationFormView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }

    @objc func backButtonTapped() {
        print("뒤로")
        back(animated: true)
    }
}

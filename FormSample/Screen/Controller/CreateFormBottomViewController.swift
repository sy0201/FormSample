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
        setupActions()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.createFormBaseView.defectiveTextView.resignFirstResponder()
    }
}

extension CreateFormBottomViewController {
    func setupActions() {
        createFormBaseView.localButton.addTarget(self, action: #selector(selectLocal), for: .touchUpInside)
        
        //createFormBaseView.unSelectedButton.addTarget(self, action: #selector(hiddenPhotoView), for: .touchUpInside)
    }
    
    @objc func selectLocal() {
        let requiredSelectionBottomVC = RequiredSelectionBottomViewController()
        
        let bottomSheetVC = CustomBottomSheetViewController(contentViewController: requiredSelectionBottomVC)
        
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: true, completion: nil)
    }
}

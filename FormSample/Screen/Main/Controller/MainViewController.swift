//
//  ViewController.swift
//  PRUGIO
//
//  Created by siyeon park on 2023/11/07.
//

import UIKit

final class MainViewController: BaseViewController {

    let mainView = MainView()
    private let viewModel = ApartmentViewModel()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTargetButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

//        mainView.gradationView.gradationView([BaseConst.COLOR_BLACK_60, BaseConst.COLOR_BLACK_00])
    }
}

// MARK: - Internal Method

extension MainViewController {
    func setupTargetButton() {
        mainView.apartmentButton.addTarget(self, action: #selector(presentModal), for: .touchUpInside)
        mainView.applicationButton.addTarget(self, action: #selector(createForm), for: .touchUpInside)
    }

    @objc func presentModal() {

//        let mainBottomSheetVC = MainBottomSheetViewController()
//        mainBottomSheetVC.viewModel = self.viewModel
//
//        let bottomSheetVC = BottomSheetViewController(contentViewController: mainBottomSheetVC)
//
//        mainBottomSheetVC.completionHandler = { [self] text in
//            mainView.apartmentLabel.text = text
//
//            if mainView.apartmentLabel.text?.isEmpty != true {
//                mainView.applicationButton.isHidden = false
//                }
//            }
//
//            bottomSheetVC.modalPresentationStyle = .overFullScreen
//            self.present(bottomSheetVC, animated: true)
    }

    @objc func createForm() {
//        guard let vc = UIStoryboard(name: "Form", bundle: nil).instantiateViewController(withIdentifier: "FormViewController") as? FormViewController else { return }
//
//        vc.selectedApartmentName = mainView.apartmentLabel.text
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

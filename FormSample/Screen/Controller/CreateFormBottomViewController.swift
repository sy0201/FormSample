//
//  CreateFormBottomViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/23.
//

import UIKit

class CreateFormBottomViewController: UIViewController {

    let createFormBaseView = CreateFormBaseView()

    override func loadView() {
        view = createFormBaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

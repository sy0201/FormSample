//
//  BaseViewController.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/17.
//

import UIKit

class BaseViewController: UIViewController {

    public func back(animated:Bool, completion: (() -> ())? = nil)  {

        if isModal {

            dismiss(animated: animated) {

                if let completion = completion {
                    completion()
                }
            }
        } else {

            if let nav = navigationController {

                nav.popViewController(animated: animated) {

                    if let completion = completion {
                        completion()
                    }
                }
            } else {

                dismiss(animated: animated) {

                    if let completion = completion {
                        completion()
                    }
                }
            }
        }
    }
}

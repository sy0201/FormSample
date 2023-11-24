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
        setupTextView()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.createFormBaseView.defectiveTextView.resignFirstResponder()
    }

    func setupTextView() {
        createFormBaseView.defectiveTextView.delegate = self

    }
}

extension CreateFormBottomViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if createFormBaseView.defectiveTextView == Asset.Color.gray9DA4AA.color {
            createFormBaseView.defectiveTextView.text = nil
            createFormBaseView.defectiveTextView.textColor = Asset.Color.black.color
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
//        if createFormBaseView.defectiveTextView.text.isEmpty {
//            createFormBaseView.defectiveTextView.font = FontFamily.NotoSansKR.regular.font(size: 14)
//            createFormBaseView.defectiveTextView.textColor = Asset.Color.gray9DA4AA.color
//            createFormBaseView.defectiveTextView.text = L10n.formMessage16
//        }

        if createFormBaseView.defectiveTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            createFormBaseView.defectiveTextView.text =  L10n.formMessage16
            createFormBaseView.defectiveTextView.textColor = Asset.Color.gray9DA4AA.color
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        return true
    }
}

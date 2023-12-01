//
//  SelectRadioCellDelegate.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/26.
//

import Foundation

protocol SelectRadioCellDelegate: AnyObject {
    func didSelectItem(_ item: String)
}

protocol FormDelegate {
    func writeForm(data: WriteFormModel)
}

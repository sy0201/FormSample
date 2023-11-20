//
//  ReuseIdentifying.swift
//  FormSample
//
//  Created by siyeon park on 2023/11/20.
//

protocol ReuseIdentifying: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

//
//  String+Extension.swift
//  Yummie
//
//  Created by mac on 7/31/21.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}

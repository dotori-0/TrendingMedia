//
//  UIImageView+Extension.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

extension UIImageView {
    func showCheckState(checked: Bool) {
        self.image = checked ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        self.tintColor = .label
    }
}

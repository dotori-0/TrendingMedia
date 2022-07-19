//
//  UIView+Extension.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

extension UITableViewCell {
    func configureTableViewCellDesign() {
        self.backgroundColor = UIColor(named: "CellBackgroundColor")
        self.layer.cornerRadius = 8
//        self.clipsToBounds = true
    }
}

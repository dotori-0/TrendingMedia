//
//  UIButton+Extension.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

extension UIButton {
    func configureButtonDesign() {
        self.backgroundColor = UIColor(named: "ButtonBackgroundColor")
        self.layer.cornerRadius = 8
    }
    
    func showFavoriteState(isFavorite: Bool) {
        self.setImage(isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
        self.setTitle("", for: .normal)
        self.tintColor = .label
    }
}

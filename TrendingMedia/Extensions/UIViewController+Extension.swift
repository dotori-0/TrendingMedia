//
//  UIViewController+Extension.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor() {
        view.backgroundColor = .orange
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))

        present(alert, animated: true)  // completion의 기본값이 nil
    }
    
    
    
}

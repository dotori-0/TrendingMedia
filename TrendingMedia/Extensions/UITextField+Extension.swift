//
//  UITextField+Extension.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

extension UITextField {
    
//    let placeholder = "이메일을 입력"  // 초기화 되는 것들은 메모리에 올라가기 때문에 저장 프로퍼티는 익스텐션 불가
    
    // 함수는 호출 시에 사용됨
    func borderColor() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.borderStyle = .none
    }
    
    
    
}

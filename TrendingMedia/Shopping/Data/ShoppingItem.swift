//
//  ShoppingItem.swift
//  TrendingMedia
//
//  Created by SC on 2022/08/22.
//

import Foundation

import RealmSwift

// ShoppingItem: 테이블 이름
// @Persisted: 각 컬럼
class ShoppingItem: Object {
    @Persisted var title: String
    @Persisted var isDone: Bool
    @Persisted var isFavorite: Bool
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(item: String) {
        self.init()
        self.title = item
        self.isDone = false
        self.isFavorite = false
    }
}

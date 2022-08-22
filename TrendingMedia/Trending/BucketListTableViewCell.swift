//
//  BucketListTableViewCell.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

class BucketListTableViewCell: UITableViewCell {
    
    static let identifier = "BucketListTableViewCell"

    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBOutlet weak var bucketListLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
}

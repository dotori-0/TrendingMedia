//
//  TextFieldTableViewCell.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

//    @IBOutlet weak var textField: UITextField!
//    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

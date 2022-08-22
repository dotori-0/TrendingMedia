//
//  SearchMovieTableViewCell.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/20.
//

import UIKit

class SearchMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    /// 셀에 데이터를 넣어주는 역할
    /// - Parameter data: 영화 정보가 들어 있음
    func configureCell(data: Movie) {
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.text = data.title
        releaseLabel.text = "2222. 22. 22"
        releaseLabel.text = data.movieDescription
        overviewLabel.text = data.overview
        overviewLabel.numberOfLines = 0
    }

}

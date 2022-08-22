//
//  Movie.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/20.
//

import Foundation


struct Movie {
    var title: String
    var releaseDate: String
    var runtime: Int
    var overview: String
    var rate: Double
    
    var movieDescription: String {
        get {
            return "\(releaseDate) | \(runtime)분 | \(rate)점"
        }
    }

}


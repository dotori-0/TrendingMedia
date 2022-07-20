//
//  SearchMovieTableViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/20.
//

import UIKit

class SearchMovieTableViewController: UITableViewController {
    
    var movieList = MovieInfo()
    
//    [
//        Movie(title: "암살", releaseDate: "22. 22. 22", runtime: 150, overview: "암살 줄거리", rate: 8.8), 
//        Movie(title: "괴물", releaseDate: "22. 22. 22", runtime: 130, overview: "괴물 줄거리", rate: 2.2)] 
//    ["암살", "괴물", "해리포터와 해리포터 해리포터", "내 머릿속의 지우개", "기묘한 이야기", "라라랜드", "라이언 일병 구하기", "외계+인"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return movieList.count
        return movieList.movie.count        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieTableViewCell", for: indexPath) as! SearchMovieTableViewCell
        
//        cell.titleLabel.font = .boldSystemFont(ofSize: 15)
//        cell.titleLabel.text = movieList[indexPath.row]
//        cell.releaseLabel.text = "2222. 22. 22"
//        cell.overviewLabel.text = "efwlwefnwenfalwjenfwenfownaeof;nawiejfna;woefn"
//        cell.overviewLabel.numberOfLines = 0
        
        let data = movieList.movie[indexPath.row]
//        cell.configureCell(data: data)
        cell.configureCell(data: data)        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 8  // 디바이스의 전체 높이
    }
    
    

}

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

    // MARK: 뷰 컨트롤러의 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
        
        print("My Words")
        
        

    }

    // MARK: 일반 액션
    /// window RootViewController 교체 - 시작화면으로 돌아가는 메서드
    
    // 기존에 쌓여 있던 화면들 모두 삭제해 줌
    @objc func resetButtonClicked() {
        // iOS 13 + 에서 SceneDelegate 쓸 때 동작하는 코드
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        // UIApplication은 AppDelegate에서 볼 수 있음
        // 아이패드는 좀 다른데, 아이폰은 씬이 하나라서 first
        
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Trending", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WelclomeViewController") as! WelclomeViewController  // guard-let이나 if-let으로 감싸주는 것이 안전하다
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
        let sb = UIStoryboard(name: "Trending", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommendCollectionViewController") as! RecommendCollectionViewController
        
//         2. 값 전달 - vc가 가지고 있는 프로퍼티에 데이터 추가
//        vc.movieTitle = "값 전달 확인"
//        let title = movieList.movie[indexPath.row].title
//        let release = movieList.movie[indexPath.row].releaseDate
//        vc.movieTitle = "\(title)\(release)"
//        vc.movieData = movieList.movie[indexPath.row]  // 주석 해제하기
        
        
        self.navigationController?.pushViewController(vc, animated: true)  // 네비게이션 컨트롤러가 있으면 푸시
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 8  // 디바이스의 전체 높이
    }
    
    

}
